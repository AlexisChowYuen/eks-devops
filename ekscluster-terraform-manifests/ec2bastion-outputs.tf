# ID of instance
output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2_instance.id
}

# Bastion EIP
output "ec2bastion_eip" {
  description = "The Elastic IP of the EC2 instance"
  value       = aws_eip.ec2bastion_eip.public_ip
}
