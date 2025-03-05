variable "vpc_cidr" {}
variable "vpc_name" {}
variable "owner" {}
variable "environment" {}
variable "aws_region" {}
variable "azs" {}
variable "public_subnet_cidrs" {}
variable "private_subnet_cidrs" {}
variable "bucket_name" {}
variable "inbound_ports" {}
variable "outbound_ports" {}
variable "appversion" {}
variable "cluster_name" {}
variable "kubernetes_version" {}
variable "ecr_name" {}
variable "type" {}
variable "public_subnet_az1_id" {}
variable "public_subnet_az2_id" {}
variable "eks_security_group_id" {}
# variable "master_arn" {}
# variable "worker_arn" {}
variable "instance_type" {}
variable "instance_size" {}
variable "worker_node_count" {}
variable "image_id" {}
variable "cluster_version" {}
variable "vpc-cni-version" {}
variable "kube-proxy-version" {}

# variable "location" {}
# variable "cluster_version" {}
# variable "nodegroup_size" {}
# variable "managed_worker_desired_size" {}
# variable "nodegroup_name" {}
# variable "eks_version" {}
# variable "custom_role_arns" {
#   type = list(string)
# }
