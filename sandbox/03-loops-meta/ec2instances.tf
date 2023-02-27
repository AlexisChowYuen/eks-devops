data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

resource "aws_instance" "myec2vm" {
  ami           = data.aws_ami.amzlinux2.id
  #instance_type = var.instance_type
  #instance_type = var.instance_type_list[0]
  instance_type = var.instance_type_map["dev"]

  key_name      = var.instance_key_pair

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_web.id
  ]

  for_each = toset(data.aws_availability_zones.available.names)
  availability_zone = each.key

  user_data = file("${path.module}/app1-install.sh")
  tags = {
    Name = "ec2instance-${each.key}"
  }
}
