aws_region = "us-east-1"
vpc_cidr   = "10.1.0.0/16"
# public_subnet1_cidr  = "10.1.1.0/24"
# public_subnet2_cidr  = "10.1.2.0/24"
# public_subnet3_cidr  = "10.1.3.0/24"
vpc_name = "terraform-hcl-vpc"
#key_name             = "aws_login"
environment = "dev"
type        = "development"
bucket_name = "gopi-terraform-state"
owner       = "DevOpsTeam"
#instance_type        = "t2.micro"
# imagename = {
#   us-east-1 = "ami-0e2c8caa4b6378d8c"
# }
# aws_secret_key      = "JERtFpzkgudd9BcvBat3sF2OAu+w7slgHW2G6pDX"
# aws_access_key      = "AKIAYXWBOHXX42QLOT6O"
azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
# public_subnet_az1_id = "10.0.1.0/24"
# public_subnet_az2_id = "10.0.2.0/24"
eks_security_group_id = "sg-0524e9bf30c865867"
public_subnet_cidrs   = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs  = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]
inbound_ports         = ["22", "80", "443", "3389", "22"]
outbound_ports        = ["80", "443", "443"]
appversion            = "1.0.0"
cluster_name          = "gopi-eks-cluster"
kubernetes_version    = "1.30"
# master_arn            = "arn:aws:iam::600627363311:role/AWSReservedSSO_business_AdministratorAccess_7f81e35e5d944516"
# worker_arn            = "arn:aws:iam::600627363311:role/AWSReservedSSO_business_ReadOnlyPrivate_b77eb6db62bcfc49"
master_arn            = "arn:aws:iam::600627363311:role/EKS-iam-master-role"
worker_arn            = "arn:aws:iam::600627363311:instance-profile/EKS-worker-nodes-profile"
instance_type         = "t3.medium"
instance_size         = "2"
worker_node_count     = "2"
image_id              = "ami-05b10e08d247fb927"
cluster_version       = "1.30"
vpc-cni-version       = "v1.18.6-eksbuild.1"
kube-proxy-version    = "v1.32.2-eksbuild.5"
ecr_name              = "gopi-ecr-repo"
#eks_security_group_id = "sg-0b3b3b3b3b3b3b3b3"
# location                    = "us-east-1"
# cluster_version             = "1.21"
# nodegroup_size              = "t3.medium"
# managed_worker_desired_size = 2
# nodegroup_name              = "gopi-eks-nodegroup"
# eks_version                 = "1.21"
# custom_role_arns = [
#   "arn:aws:iam::600627363311:role/AWSReservedSSO_business_ContributorPrivate_7f81e35e5d944516",
#   "arn:aws:iam::600627363311:role/AWSReservedSSO_business_ReadOnlyPrivate_b77eb6db62bcfc49"
# ]

