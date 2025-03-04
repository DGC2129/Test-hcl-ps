output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.default.id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.default.arn
}

output "aws_eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.HCl-Cluster.name
}

output "aws_eks_cluster_id" {
  description = "The ID of the EKS cluster"
  value       = aws_eks_cluster.HCl-Cluster.id
}


# output "cluster_id" {
#   description = "EKS cluster ID."
#   value       = module.eks.cluster_id
# }

# output "cluster_endpoint" {
#   description = "Endpoint for EKS control plane."
#   value       = module.eks.cluster_endpoint
# }

# output "cluster_security_group_id" {
#   description = "Security group ids attached to the cluster control plane."
#   value       = module.eks.cluster_security_group_id
# }

output "region" {
  description = "AWS region"
  value       = var.aws_region
}


output "registry_id" {
  description = "ECR registry ID"
  value       = aws_ecr_repository.HCL-myecr.registry_id
}

output "registry_url" {
  description = "ECR registry URL"
  value       = aws_ecr_repository.HCL-myecr.repository_url
}

output "lb_dns_name" {
  description = "The DNS name of the LB"
  value       = aws_lb.LB.dns_name
}

# output "aws_iam_role" {
#   description = "IAM role ARN"
#   value       = aws_iam_role.iam_role.arn
# }