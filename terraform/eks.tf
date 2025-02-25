module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.33.1"
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version
  subnet_ids      = (aws_subnet.private-subnets[*].id)

  enable_irsa = true

  tags = {
    cluster = "demo"
  }

  vpc_id = aws_vpc.default.id

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [aws_security_group.allow_all_new.id] # security group id
  }

  eks_managed_node_groups = {

    node_group = {
      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }
}

# module "eks" {
#   source                        = "terraform-aws-modules/eks/aws"
#   eks_vpc_cidr                  = aws_vpc.default.cidr_block
#   region                        = var.aws_region
#   vpc_id                        = aws_vpc.default.id
#   cluster_name                  = var.cluster_name
#   eks_master_security_group_ids = [aws_security_group.sg.id]
#   environment                   = var.environment
#   debug                         = false
#   eks_master_subnet_ids         = local.eks_master_subnet_ids
#   encrypt_secrets               = true
#   #kms_key_alias                 = local.kms_key_alias
#   eks_public_access_cidrs       = ["0.0.0.0/0"]
#   enable_cluster_logs           = false
#   manage_cluster_admin_iam_auth = true
#   create_managed_nodegroup      = true
#   managed_worker_instance_type  = local.node_size
#   managed_worker_desired_size   = var.managed_worker_desired_size
#   managed_worker_disk_size      = "20"
#   managed_worker_max_size       = "4"
#   managed_worker_min_size       = "1"
#   managed_nodegroup_name        = var.nodegroup_name
#   managed_nodegroup_k8s_node_labels = {
#     "app" = "test"
#   }
#   enable_ssh                    = false
#   worker_subnet_ids             = local.eks_worker_subnet_ids
#   create_self-managed_nodegroup = false
#   create_oidc_provider          = true
#   custom_role_arns              = var.custom_role_arns
#   clusteradmin_user_arns = [
#     "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.cluster_name}"
#   ]
#   tags = {
#     "karpenter.sh/discovery" = var.cluster_name
#   }
#   clusteradmin_role_trusted_policy = ""
# }


# # data "aws_iam_openid_connect_provider" "eks" {
# #   depends_on = [ module.eks ]
# #   url = "https://${module.eks.oidc_issuer}"
# # }

# resource "kubernetes_namespace" "Hcl-Cluster" {
#   depends_on = [module.eks]
#   metadata {
#     name = "Hcl-GK-Cluster"
#   }
# }