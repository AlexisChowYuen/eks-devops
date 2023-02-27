data "aws_ec2_instance_type_offerings" "instance_type2" {
    for_each = toset(["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"])
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}

output "output_v2" {
  value = toset([for instance in data.aws_ec2_instance_type_offerings.instance_type2 : instance.instance_types])
}

output "output_v2_2" {
  value = {for az, instance in data.aws_ec2_instance_type_offerings.instance_type2 : az => instance.instance_types}
}