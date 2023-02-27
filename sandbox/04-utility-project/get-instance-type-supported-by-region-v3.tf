data "aws_availability_zones" "my_azs" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_ec2_instance_type_offerings" "instance_type3" {
  for_each = toset(data.aws_availability_zones.my_azs.names)
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

output "output_v3" {
  value = { for az, instance in data.aws_ec2_instance_type_offerings.instance_type3 : az => instance.instance_types }
}

output "output_v3_2" {
  value = {
    for az, instance in data.aws_ec2_instance_type_offerings.instance_type3:
    az => instance.instance_types if length(instance.instance_types) > 0
  }
} 

output "output_v3_3" {
  value = keys({
    for az, instance in data.aws_ec2_instance_type_offerings.instance_type3:
    az => instance.instance_types if length(instance.instance_types) > 0
  })
}