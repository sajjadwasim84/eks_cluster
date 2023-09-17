variable "name" {
  description = "Name for your infrastructure resources"
}

variable "instance_eks" {
  description = "Instance type for EKS managed node group"
  default     = "t2.micro" # Adjust to your desired instance type
}

# Add other variables as needed for your main configuration...

#variable "cidr" {} 

#variable "azs" {} 
#variable "public_subnets" {} 

#variable "private_subnets" {} 

#variable "intra_subnets" {} 


variable "cidr" {
  description = "172.31.0.0/16"
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = ["172.31.3.0/24", "172.31.4.0/24"]
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["172.31.1.0/24", "172.31.2.0/24"]
}

variable "intra_subnets" {
  description = "List of intra subnet CIDR blocks"
  type        = list(string)
  default     = ["172.31.5.0/24", "172.31.6.0/24"]
}






