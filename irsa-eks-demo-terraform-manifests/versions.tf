terraform {
    required_version = ">= 1.0.0"
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~>3.70"
      }
      kubernetes = {
        source = "hashicorp/kubernetes"
        version = "~>2.7"
      }
    }

    backend "s3" {
      bucket = "terraform-on-aws-eks-acy"
      key    = "dev/irsa-demo/terraform.tfstate"
      region = "us-east-1"

      # For lock state
      dynamodb_table = "dev-irsa-demo"
    }
}