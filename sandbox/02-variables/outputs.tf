output "instance_publicip" {
    description = "Public IP of the EC2 instance"
    value = aws_instance.myec2vm.public_ip
}

output "instance_publicdns" {
    description = "Public DNS of the EC2 instance"
    value = aws_instance.myec2vm.public_dns
}