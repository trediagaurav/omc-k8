terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws        = { source = "hashicorp/aws" }
    kubernetes = { source = "hashicorp/kubernetes" }
    helm       = { source = "hashicorp/helm" }
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "myaccount"
}

module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = "omc-elk-ci-cd-vpc"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  environment     = "dev"
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = "omc-eks-cluster"
  cluster_version = "1.28"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
  environment     = "dev"
}

module "nodegroup" {
  source        = "./modules/nodegroup"
  cluster_name  = module.eks.cluster_name
  subnet_ids    = module.vpc.private_subnets
  instance_type = "t3.medium"
  desired_size  = 3
  min_size      = 1
  max_size      = 5
}
