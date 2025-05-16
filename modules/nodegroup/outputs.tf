# modules/nodegroup/outputs.tf

output "node_group_role_arn" {
  value = aws_iam_role.node_group_role.arn
}

output "node_group_name" {
  value = aws_eks_node_group.ng.node_group_name
}
