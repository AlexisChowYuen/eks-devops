# AWS Partition
data "aws_partition" "current" {}

# AWS IAM OpenID Connect Provider

resource "aws_iam_openid_connect_provider" "eks_oidc_provider" {
  url             = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
  client_id_list  = ["sts.${data.aws_partition.current.dns_suffix}"]
  thumbprint_list = [var.eks_oidc_root_ca_thumbprint]

  tags = merge(
    {
      Name = "${var.cluster_name}-eks-irsa"
    },
    local.comment_tags
  )
}

output "aws_iam_openid_connect_provider_arn" {
  description = "AWS IAM OpenID Connect Provider ARN"
  value       = aws_iam_openid_connect_provider.eks_oidc_provider.arn
}

locals {
  aws_iam_oidc_connect_provider_extract_from_arn = element(
  split("oidc-provider/", "${aws_iam_openid_connect_provider.eks_oidc_provider.arn}"), 1)
}

output "aws_iam_oidc_connect_provider_extract_from_arn" {
  description = "AWS IAM OpenID Connect Provider Extracted from ARN"
  value       = local.aws_iam_oidc_connect_provider_extract_from_arn
}
