variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
}

variable "node_group_defaults" {
  description = "Default configuration for node groups"
}

variable "node_groups" {
  description = "Node groups configurations"
}
