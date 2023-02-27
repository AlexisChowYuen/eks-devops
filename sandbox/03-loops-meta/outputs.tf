/* -------------------------------------------------------------------------------------------------------- Public IP */
/*
output "instance_publicip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.myec2vm.public_ip
}

output "instance_publicdns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.myec2vm.public_dns
}
*/
/* --------------------------------------------------------------------------------------------------------- For loop */

output "for_output_list" {
  description = "For loop with list"
  value       = [for x in aws_instance.myec2vm : x.public_dns]
}

output "for_output_map" {
  description = "For loop with map"
  value = {
    for x in aws_instance.myec2vm : x.id => x.public_dns
  }
}

output "for_output_map2" {
  description = "For loop with map advanced"
  value = {
    for c, instance in aws_instance.myec2vm : c => instance.public_dns
  }
}

# output "legacy_splat_public_dns" {
#   description = "Legacy Splat Operator legacy"
#   value       = aws_instance.myec2vm.*.public_dns
# }

# output "latest_splat_public_dns" {
#   description = "Generalized Splat Operator"
#   value       = aws_instance.myec2vm[*].public_dns
# }

/* --------------------------------------------------------------------------------------------------------- For_each */

output "for_each_public_dns" {
  description = "Generalized Splat Operator"
  value       = [for instance in aws_instance.myec2vm : instance.public_dns]
}

output "for_each_public_dns2" {
  description = "public dns with map"
  value       = tomap({ for az, instance in aws_instance.myec2vm : az => instance.public_dns })
}