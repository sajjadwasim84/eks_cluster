module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name              = "eks"
  cidr              =  var.cidr
  azs               =  var.azs
  public_subnets    =  var.public_subnets
  private_subnets   =  var.private_subnets
  intra_subnets     =  var.intra_subnets
  enable_nat_gateway = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}
