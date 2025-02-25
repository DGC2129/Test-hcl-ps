# module "eks_blueprints_addons" {
#   source  = "aws-ia/eks-blueprints-addons/aws"
#   version = "~>1.7.0"

#   cluster_name     = module.eks.cluster_name
#   cluster_endpoint = module.eks.cluster_endpoint
#   cluster_version  = module.eks.cluster_version
#   #oidc_provider_arn = data.aws_iam_openid_connect_provider.eks.arn

#   eks_addons = {
#     coredns = {
#       most_recent = true
#     }
#     vpc-cni = {
#       most_recent = true
#     }
#     kube-proxy = {
#       most_recent = true
#     }
#   }

#   enable_aws_load_balancer_controller = true
#   enable_ingress_nginx                = true
#   ingress_nginx = {
#     repository    = "https://kubernetes.github.io/ingress-nginx"
#     chart_version = "4.8.3"
#     values        = [file("nginx-helm-values-${var.environment}.yaml")]
#   }
#   enable_external_dns            = true
#   external_dns_route53_zone_arns = var.route53_zone_arns
#   # external_dns = {
#   #   repository    = "https://kubernetes-sigs.github.io/external-dns/"
#   #   chart_version = "1.13.0"
#   #   values        = [file("external-dns-helm-values.yaml")]
#   # }
#   tags = {
#     Environment = var.environment
#   }
# }