locals {
  private_subnet_cidrs = distinct(var.private_subnet_cidrs)
  public_subnet_cidrs  = distinct(var.public_subnet_cidrs)
  azs                  = distinct(var.azs)
  cluster_name         = "${var.vpc_name}-${var.environment}"
  #eks_addons           = ["vpc-cni", "kube-proxy"]
  #   location              = var.location
  #   eks_version           = var.cluster_version
  #   node_size             = var.nodegroup_size
  #   eks_master_subnet_ids = aws_subnet.private-subnets[*].id
  #   eks_worker_subnet_ids = aws_subnet.private-subnets[*].id
}