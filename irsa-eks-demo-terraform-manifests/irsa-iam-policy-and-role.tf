resource "aws_iam_role" "irsa_iam_role" {
  name               = "${local.name}-irsa-iam-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Federated": "${data.terraform_remote_state.eks.outputs.aws_iam_openid_connect_provider_arn}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${data.terraform_remote_state.eks.outputs.aws_iam_oidc_connect_provider_extract_from_arn}:sub": "system:serviceaccount:default:irsa-demo-sa"
        }
      }
    }
  ]
}
EOF

  tags = {
    tag-key = "${local.name}-irsa-iam-role"
  }
}

resource "aws_iam_role_policy_attachment" "irsa_iam_role_policy_attachment" {
  role       = aws_iam_role.irsa_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

output "irsa_iam_role_arn" {
  description = "IRSA IAM Role ARN"
  value       = aws_iam_role.irsa_iam_role.arn
}