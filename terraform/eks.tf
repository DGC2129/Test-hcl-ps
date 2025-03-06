# module "eks" {
#   source          = "terraform-aws-modules/eks/aws"
#   version         = "20.33.1"
#   cluster_name    = local.cluster_name
#   cluster_version = var.kubernetes_version
#   subnet_ids      = (aws_subnet.private-subnets[*].id)

#   enable_irsa = true

#   tags = {
#     cluster = "demo"
#   }

#   vpc_id = aws_vpc.default.id

#   eks_managed_node_group_defaults = {
#     ami_type               = "AL2_x86_64"
#     instance_types         = ["t3.medium"]
#     vpc_security_group_ids = [aws_security_group.allow_all_new.id] # security group id
#   }

#   eks_managed_node_groups = {

#     node_group = {
#       min_size     = 2
#       max_size     = 6
#       desired_size = 2
#     }
#   }
# }

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

# Creating EKS Cluster
# resource "aws_eks_cluster" "HCl-Cluster" {
#   name     = var.cluster_name
#   role_arn = aws_iam_role.master.arn
#   version  = var.cluster_version

#   vpc_config {
#     subnet_ids = [var.public_subnet_az1_id, var.public_subnet_az2_id]
#     #subnet_ids = aws_subnet.public-subnets.id
#   }

#   tags = {
#     key   = var.environment
#     value = var.type
#   }
# }

# # Using Data Source to get all Avalablility Zones in Region
# #data "aws_availability_zones" "available_zones" {}

# # Creating Launch Template for Worker Nodes
# resource "aws_launch_template" "worker-node-launch-template" {
#   name = "worker-node-launch-template"
#   block_device_mappings {
#     device_name = "/dev/sdf"

#     ebs {
#       volume_size = 20
#     }
#   }

#   image_id      = var.image_id
#   instance_type = "t2.micro"
#   user_data = base64encode(<<-EOF
# MIME-Version: 1.0
# Content-Type: multipart/mixed; boundary="==MYBOUNDARY=="
# --==MYBOUNDARY==
# Content-Type: text/x-shellscript; charset="us-ascii"
# #!/bin/bash
# /etc/eks/bootstrap.sh prod-cluster
# --==MYBOUNDARY==--\
#   EOF
#   )


#   vpc_security_group_ids = [var.eks_security_group_id]

#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name = "Worker-Nodes"
#     }
#   }
# }

# # Creating Worker Node Group
# resource "aws_eks_node_group" "node-grp" {
#   cluster_name    = aws_eks_cluster.HCl-Cluster.name
#   node_group_name = "Worker-Node-Group"
#   node_role_arn   = aws_iam_role.worker.arn
#   subnet_ids = [var.public_subnet_az1_id, var.public_subnet_az2_id]
#   #subnet_ids = aws_subnet.public-subnets.id

#   launch_template {
#     name    = aws_launch_template.worker-node-launch-template.name
#     version = aws_launch_template.worker-node-launch-template.latest_version
#   }

#   labels = {
#     env = "Prod"
#   }

#   scaling_config {
#     desired_size = var.worker_node_count
#     max_size     = 7
#     min_size     = 1
#   }

#   update_config {
#     max_unavailable = 1
#   }
# }

# locals {
#   eks_addons = {
#     "vpc-cni" = {
#       version           = var.vpc-cni-version
#       resolve_conflicts = "OVERWRITE"
#     },
#     "kube-proxy" = {
#       version           = var.kube-proxy-version
#       resolve_conflicts = "OVERWRITE"
#     }
#   }
# }

# # Creating the EKS Addons
# resource "aws_eks_addon" "example" {
#   for_each                    = local.eks_addons
#   cluster_name                = aws_eks_cluster.HCl-Cluster.name
#   addon_name                  = each.key
#   addon_version               = each.value.version
#   resolve_conflicts_on_update = each.value.resolve_conflicts
# }