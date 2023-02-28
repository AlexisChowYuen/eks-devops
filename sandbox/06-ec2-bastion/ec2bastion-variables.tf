# AWS EC2 Bastion Host Variables - Terraform

# AWS EC2 Instance Type 
variable "instance_type" {
  description = "The type of instance to start."
  type        = string
  default     = "t2.micro"
}

# AWS EC2 Instance Key Name
variable "instance_keypair" {
    description = "AWS EC2 Instance Key Pair Name"
    type = string
    default = "terraform-key"
}
