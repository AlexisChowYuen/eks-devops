terraform {
    required_version = "~> 1.3.7"

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }

    backend "s3" {
        bucket = "terraform-on-aws-eks-acy"
        key    = "dev/eks-cluster/terraform.tfstate"
        region = "us-east-1"

        # For state locking
        dynamodb_table = "dev-ekscluster"
    }
}

provider "aws" {
    region = var.aws_region
} 