output "node_group_name" {
  description = "Name of the EKS node group"
  value       = aws_autoscaling_group.example.name
}

output "launch_template_id" {
  description = "ID of the launch template used by the node group"
  value       = aws_launch_template.example.id
}

# Define other outputs as needed...
