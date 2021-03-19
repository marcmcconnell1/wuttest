module "aws_vpc" {
  source = "../../components/vpc"

  name = var.vpc_name
  cidr = var.vpc_cidr

  public_subnets             = var.public_subnets
  enable_nat_gateway         = var.enable_nat_gateway ? true : false
  one_nat_gateway_per_az     = var.one_nat_gateway_per_az ? true : false
  private_subnets            = var.private_subnets
  manage_default_route_table = var.manage_default_route_table ? true : false
  default_route_table_routes = var.default_route_table_routes

  enable_dns_hostnames     = var.enable_dns_hostnames
  enable_dhcp_options      = var.enable_dhcp_options
  dhcp_options_domain_name = "${var.route53_domain_name}.${var.route53_name_internal_tld}"

  enable_dynamodb_endpoint = var.enable_dynamodb_endpoint
  amazon_side_asn          = var.vpn_gateway_amazon_side_asn

  # Default security group - ingress/egress rules cleared to deny all
  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []

  # Tags
  tags     = var.tags
  vpc_tags = var.vpc_tags
}


