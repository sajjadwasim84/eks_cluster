variable "cluster_name" {
  description = "Name of the EKS cluster"
}

variable "cluster_endpoint_public_access" {
  description = "Whether the EKS cluster's API endpoint is publicly accessible"
  default     = true
}

variable "cluster_version" {
  description = "EKS cluster Kubernetes version"
}

# Add more variables as needed...
