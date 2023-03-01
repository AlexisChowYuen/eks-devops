# EKS Cluster Outputs

output "cluster_id" {
    description = "The ID of the EKS cluster"
    value       = aws_eks_cluster.eks_cluster.id
}

output "cluster_arn" {
    description = "The ARN of the EKS cluster"
    value       = aws_eks_cluster.eks_cluster.arn
}

output "cluster_certificate_authority_data" {
    description = "The certificate-authority-data for the cluster"
    value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_endpoint" {
    description = "The endpoint for the EKS cluster"
    value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_version" {
    description = "The Kubernetes server version for the EKS cluster"
    value       = aws_eks_cluster.eks_cluster.version
}

output "cluster_security_group_id" {
    description = "The security group ID of the EKS cluster"
    value       = [ aws_eks_cluster.eks_cluster.vpc_config[0].security_group_ids ]
}

output "cluster_primary_security_group_id" {
    description = "The primary security group ID of the EKS cluster"
    value       = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

output "cluster_iam_role_arn" {
    description = "The IAM role ARN of the EKS cluster"
    value       = aws_iam_role.ekscluster.arn
}

output "cluster_iam_role_name" {
    description = "The IAM role name of the EKS cluster"
    value       = aws_iam_role.ekscluster.name
}

output "cluster_oidc_issuer_url" {
    description = "The OIDC issuer URL of the EKS cluster"
    value       = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

# EKS Node Outputs - Public

output "node_group_public_id" {
    description = "The ID of the EKS node group"
    value       = aws_eks_node_group.eks_nodegroup_public.id
}

output "node_group_public_arn" {
    description = "The ARN of the EKS node group"
    value       = aws_eks_node_group.eks_nodegroup_public.arn
}

output "node_group_public_status" {
    description = "The status of the EKS node group"
    value       = aws_eks_node_group.eks_nodegroup_public.status
}

output "node_group_public_version" {
    description = "The Kubernetes version of the EKS node group"
    value       = aws_eks_node_group.eks_nodegroup_public.version
}

# EKS Node Outputs - Private

# output "node_group_private_id" {
#     description = "The ID of the EKS node group"
#     value       = aws_eks_node_group.eks_nodegroup_private.id
# }

# output "node_group_private_arn" {
#     description = "The ARN of the EKS node group"
#     value       = aws_eks_node_group.eks_nodegroup_private.arn
# }

# output "node_group_private_status" {
#     description = "The status of the EKS node group"
#     value       = aws_eks_node_group.eks_nodegroup_private.status
# }

# output "node_group_private_version" {
#     description = "The Kubernetes version of the EKS node group"
#     value       = aws_eks_node_group.eks_nodegroup_private.version
# }