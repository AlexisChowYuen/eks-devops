resource "aws_eip" "ec2bastion_eip" {
  depends_on = [module.ec2_instance, module.vpc]
  instance   = module.ec2_instance.id
  vpc        = true
  tags       = local.comment_tags
}