data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  # VPC Basic details
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr
  #azs             = var.vpc_azs
  azs             = data.aws_availability_zones.available.names
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  # Databse subnets
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets                   = var.vpc_database_subnets

  #   create_database_internet_gateway_route = true   (default: false)  because doesn't communicate with the internet
  #   create_database_nat_gateway_route = true        (default: false)  because doesn't communicate with nat gateway

  # NAT GAteway
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway #(default: false) because we want to reduce cost (not in production)

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "Public Subnet"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

  private_subnet_tags = {
    Type = "Private Subnet"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags     = local.comment_tags
  vpc_tags = local.comment_tags

}
