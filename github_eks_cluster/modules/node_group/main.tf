resource "aws_launch_template" "example" {
  name_prefix   = "example-"
  instance_type = var.instance_type
  # Define other launch template settings as needed...
}

resource "aws_autoscaling_group" "example" {
  name_prefix   = "example-"
  min_size      = var.min_size
  max_size      = var.max_size
  desired_capacity = var.desired_size
  launch_template {
    id = aws_launch_template.example.id
    version = "$Latest" # Use the latest launch template version
  }
  # Define other auto scaling group settings as needed...
}

# Define other resources related to your node group...
