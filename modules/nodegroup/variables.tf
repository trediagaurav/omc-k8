# modules/nodegroup/variables.tf

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for EKS node group"
  type        = list(string)
}

variable "instance_type" {
  description = "Instance type for node group"
  type        = string
  default     = "t3.medium"
}

variable "desired_size" {
  description = "Desired node group size"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Minimum node group size"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum node group size"
  type        = number
  default     = 5
}
