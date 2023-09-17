resource "aws_security_group" "example" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  // Define security group rules here
  // Example:
  // ingress {
  //   from_port   = 80
  //   to_port     = 80
  //   protocol    = "tcp"
  //   cidr_blocks = ["0.0.0.0/0"]
  // }
}

# Define other resources related to security groups if needed...
