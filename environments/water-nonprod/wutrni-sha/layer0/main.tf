# buckets and keys named as per IT naming convention doc
terraform {

  backend "s3" {
    region         = "eu-west-2"
    bucket         = "wutrni-sha-npd-tfstate.s3.euwe2.aws"
    key            = "layer0/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform-state-locks_sha"
  }

  required_version = "= 0.14.8"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  allowed_account_ids = [var.aws_account_id]
  region              = var.aws_region
}

module "layer0" {
  source = "../../../../modules/layers/layer0"

  vpc_name = "${var.tags["owner"]}${var.tags["solution"]}-${var.tags["tenant"]}-${var.tags["environment"]}.vpc.${var.tags["project_region"]}.${var.tags["provider"]}"

  region = var.aws_region

  vpc_cidr             = var.vpc_cidr_range
  enable_dhcp_options  = var.enable_dhcp_options
  enable_dns_hostnames = var.enable_dns_hostnames

  manage_default_route_table = true
  default_route_table_routes = var.default_route_table_routes

  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  # Route53
  route53_domain_name       = var.route53_domain_name
  route53_name_internal_tld = var.route53_name_internal_tld

  # Tags
  tags = var.tags

}

