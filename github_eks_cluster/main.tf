# Initialize AWS provider (you may need to configure provider credentials)

provider "aws" {
  region = "us-west-2" # Replace with your desired AWS region
}
# Define the VPC module
module "vpc" {
  source = "./modules/vpc"
  name   = var.name
  cidr   = "172.31.0.0/16"
  azs    = var.azs
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  intra_subnets = var.intra_subnets

  # Add other VPC module variables as needed...
}
# Define the ECR module
module "ecr" {
  source = "./modules/ecr"
  name   = var.name
  # Add other ECR module variables as needed...
}
/*
# Define the RDS module

module "rds" {
  source     = "./modules/rds"
  name       = var.name
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  # Add other RDS module variables as needed...
}
*/
# Define the EKS module
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.name
  cluster_version = "1.25"
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.private_subnets
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  cluster_enabled_log_types   = []
  create_kms_key              = false
  cluster_encryption_config   = {}
  create_cloudwatch_log_group = false
  # Add other EKS module variables as needed...
}
# Define the EKS Managed Node Group module
module "eks_managed_node_group" {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  name                              = "${var.name}-node-group"
  cluster_name                      = module.eks.cluster_name
  cluster_version                   = module.eks.cluster_version
  subnet_ids                        = module.vpc.private_subnets
  cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
  min_size     = 1
  max_size     = 2
  desired_size = 1
  instance_types = [var.instance_eks]
  capacity_type  = "ON_DEMAND"
  # Add other Managed Node Group module variables as needed...
}
# Define providers for Kubernetes and Helm (for provisioning Helm charts)
/*
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", var.name]
    command     = "aws"
  }
}
*/
provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.name]
      command     = "aws"
    }
  }
}

# Define the EKS Ingress module

module "eks-ingress" {
  source = "./modules/eks-ingress"
  name   = var.name
  eks    = module.eks
  # Add other EKS Ingress module variables as needed...
}
