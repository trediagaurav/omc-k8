# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "jenkins_load_balancer_hostname" {
  value       = data.kubernetes_service.jenkins.status[0].load_balancer[0].ingress[0].hostname
  description = "Jenkins LoadBalancer DNS Name"
}

output "jenkins_url" {
  value       = "http://${data.kubernetes_service.jenkins.status[0].load_balancer[0].ingress[0].hostname}:8080"
  description = "Jenkins Web UI URL"
}

output "jenkins_admin_username" {
  description = "Jenkins admin username"
  value       = base64decode(data.kubernetes_secret.jenkins_admin.data["jenkins-admin-user"])
  sensitive   = true
}

output "jenkins_admin_password" {
  description = "Jenkins admin password"
  value       = base64decode(data.kubernetes_secret.jenkins_admin.data["jenkins-admin-password"])
  sensitive   = true
}
