# VPC Input variables

# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type = string
  default = "myvpc"
}

# VPC CIDR
variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
  default = "10.0.0.0/16"
}

# VPC Availability Zones
# variable "vpc_azs" {
#   description = "VPC Availability Zones"
#   type = list(string)
#   default = ["us-east-1a", "us-east-1b"]
# }

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

# VPC Database Subnets
variable "vpc_database_subnets" {
  description = "VPC Database Subnets"
  type = list(string)
  default = ["10.0.151.0/24", "10.0.152.0/24"]
}

# VPC Create Database Subnet Group (default: true)
variable "vpc_create_database_subnet_group" {
  description = "VPC Create Database Subnet Group (default: true)"
  type = bool
  default = true
}

# VPC Create Database Subnet Route Table (default: true)
variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table (default: true)"
  type = bool
  default = true
}

# VPC Enable NAT Gateway (default: true)
variable "vpc_enable_nat_gateway" {
  description = "VPC Enable NAT Gateway (default: true)"
  type = bool
  default = true
}

# VPC Single NAT Gateway (default: true)
variable "vpc_single_nat_gateway" {
  description = "VPC Single NAT Gateway (default: true)"
  type = bool
  default = true
}