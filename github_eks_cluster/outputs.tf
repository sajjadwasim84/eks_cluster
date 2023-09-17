# Define outputs for resources you want to expose from your main configuration

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_node_group_name" {
  value = module.eks_managed_node_group.name
}

# Add other outputs as needed...
