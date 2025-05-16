# modules/eks/outputs.tf

output "cluster_name" {
  value       = module.eks.cluster_name
  description = "EKS cluster name"
}

output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "EKS cluster endpoint"
}

output "cluster_security_group_id" {
  value       = module.eks.cluster_security_group_id
  description = "Cluster security group ID"
}
