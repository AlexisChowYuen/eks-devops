# resource "aws_eks_node_group" "eks_nodegroup_private" {
#   cluster_name    = aws_eks_cluster.eks_cluster.name
#   node_group_name = "${local.name}-eks-ng-private"
#   node_role_arn   = aws_iam_role.eks_nodegroup.arn
#   subnet_ids      = module.vpc.private_subnets
#   #   version         = var.cluster_version

#   scaling_config {
#     desired_size = 1
#     max_size     = 2
#     min_size     = 1
#   }

#   instance_types = ["t3.medium"]
#   ami_type       = "AL2_x86_64"
#   capacity_type  = "ON_DEMAND"
#   disk_size      = 20

#   remote_access {
#     ec2_ssh_key = var.instance_keypair
#   }

#   update_config {
#     # max_unavailable_percentage = 50
#     max_unavailable = 1
#   }

#   depends_on = [
#     aws_iam_role_policy_attachment.eks_nodegroup,
#     aws_iam_role_policy_attachment.eks_nodegroup-cni,
#     aws_iam_role_policy_attachment.eks_nodegroup-ecr
#   ]

#   tags = {
#     Name = "Private-Node-Group"
#   }
# }
