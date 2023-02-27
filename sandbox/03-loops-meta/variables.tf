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

variable "instance_type_list" {
    description = "List Instance type for EC2 instances"
    type = list(string)
    default = ["t2.micro", "t3.micro"]
}

variable "instance_type_map" {
    description = "List Instance type for EC2 instances"
    type = map(string)
    default = {
        "dev": "t2.micro",
        "prod": "t3.micro"
    }
}

/* -------------------------------------------------------------------------------------------- EC2 INSTANCE KEY PAIR */

variable "instance_key_pair" {
    description = "Key pair for EC2 instances"
    type = string
    default = "terraform-key"
}