variable "name" {
  description = "Name of the security group"
}

variable "description" {
  description = "Description of the security group"
}

variable "vpc_id" {
  description = "VPC ID where the security group should be created"
}

# Define variables for security group rules if needed...
