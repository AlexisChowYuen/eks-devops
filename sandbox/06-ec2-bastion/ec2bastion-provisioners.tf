resource "null_resource" "copy_ec2_keys" {
    depends_on = [module.ec2_instance]
    
    # Connection Block for provisioners to connect to ec2 instance
    connection {
      type = "ssh"
      host = aws_eip.ec2bastion_eip.public_ip
      user = "ec2-user"
      password = ""
      private_key = file("private-keys/terraform-key.pem")
    }

    # Provisioner to copy private key to ec2 instance
    provisioner "file" {
      source = "private-keys/terraform-key.pem"
      destination = "/tmp/terraform-key.pem"
    }

    # Remote Exec Provisioner : chmod 400 private key
    provisioner "remote-exec" {
      inline = [
        "chmod 400 /tmp/terraform-key.pem"
      ]
    }

    # Local Exec Provisioner : get VPC ID
    provisioner "local-exec" {
      command = "echo VPC created on `date` and VPC ID is ${module.vpc.vpc_id} >> vpc.txt"
      working_dir = "local-exec-output-files"
    }
}