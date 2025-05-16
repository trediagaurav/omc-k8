# modules/eks/variables.tf

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "omc-eks-cluster"
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.28"
}

variable "subnet_ids" {
  description = "Subnets for EKS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for EKS cluster"
  type        = string
}

variable "environment" {
  description = "The environment name"
  type        = string
  default     = "dev"
}
