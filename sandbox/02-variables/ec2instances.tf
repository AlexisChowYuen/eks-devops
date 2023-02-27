resource "aws_instance" "myec2vm" {
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.instance_key_pair

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_web.id
  ]

  user_data = file("${path.module}/app1-install.sh")
  tags = {
    Name = "ec2instance-2"
  }
}
