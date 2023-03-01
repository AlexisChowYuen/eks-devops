resource "aws_iam_role" "ekscluster" {
  name               = "ekscluster"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Associate IAM Policy to IAM Role
resource "aws_iam_role_policy_attachment" "ekscluster" {
  role       = aws_iam_role.ekscluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

// Policy EKS vpc ressource controller
resource "aws_iam_role_policy_attachment" "eks-vpc-resource-controller" {
  role       = aws_iam_role.ekscluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}
