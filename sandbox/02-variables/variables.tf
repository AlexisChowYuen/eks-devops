/* ------------------------------------------------------------------------------------------------------- AWS REGION */

variable "aws_region" {
    description = "Region for AWS resources"
    type = string
    default = "us-east-1"
}

/* ------------------------------------------------------------------------------------------------ EC2 INSTANCE TYPE */

variable "instance_type" {
    description = "Instance type for EC2 instances"
    type = string
    default = "t2.micro"
}

/* -------------------------------------------------------------------------------------------- EC2 INSTANCE KEY PAIR */

variable "instance_key_pair" {
    description = "Key pair for EC2 instances"
    type = string
    default = "terraform-key"
}