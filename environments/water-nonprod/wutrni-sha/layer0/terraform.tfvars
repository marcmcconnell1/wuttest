# Deployment definition
aws_region = "eu-west-2"

tags = {
  owner          = "wut"
  solution       = "rni"
  tenant         = "sha"
  environment    = "npd"
  project_region = "euwe2"
  provider       = "aws"
}

# AWS Provider
# water RNI nonprod
aws_account_id = "781845546355"


# VPC
###########################################
vpc_cidr_range = "10.12.204.0/22" ##
###########################################
private_subnets = {
  "eu-west-2a" : {
    "wutrni-sha-npd-001.sub.euwe2a.aws" : "10.12.204.0/26",
    "wutrni-sha-npd-002.sub.euwe2a.aws" : "10.12.205.0/26",
  },
  "eu-west-2b" : {
    "wutrni-sha-npd-001.sub.euwe2b.aws" : "10.12.204.64/26",
    "wutrni-sha-npd-002.sub.euwe2b.aws" : "10.12.205.64/26",
  },
  "eu-west-2c" : {
    "wutrni-sha-npd-001.sub.euwe2c.aws" : "10.12.204.128/26",
    "wutrni-sha-npd-002.sub.euwe2c.aws" : "10.12.205.128/26",
  }
}


enable_dhcp_options = true

enable_nat_gateway = false

one_nat_gateway_per_az = false

# uncomment once we have the TGW attached
#default_route_table_routes = [
#  {
#    "cidr_block" : "0.0.0.0/0",
#    "transit_gateway_id" : ["tgw-09bc9fbb14899984f"]
#  }
#]

# Route53
enable_dns_hostnames = "true"

route53_domain_name = "wutrni-sha-npd.euwe2.aws"

route53_name_internal_tld = "internal"

