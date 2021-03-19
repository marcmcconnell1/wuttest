# Deployment definition
aws_region = "eu-west-2"

tags = {
  owner          = "wut"
  solution       = "rni"
  tenant         = "tha"
  environment    = "wkl"
  project_region = "euwe2"
  provider       = "aws"
}

# AWS Provider
# water RNI nonprod
aws_account_id = "781845546355"


# VPC
###########################################
vpc_cidr_range = "10.12.212.0/23" ##
###########################################
private_subnets = {
  "eu-west-2a" : {
    "wutrni-wkl-npd-001.sub.euwe2a.aws" : "10.12.212.0/27",
    "wutrni-wkl-npd-002.sub.euwe2a.aws" : "10.12.212.128/27",
  },
  "eu-west-2b" : {
    "wutrni-wkl-npd-001.sub.euwe2b.aws" : "10.12.212.32/27",
    "wutrni-wkl-npd-002.sub.euwe2b.aws" : "10.12.212.160/27",
  },
  "eu-west-2c" : {
    "wutrni-wkl-npd-001.sub.euwe2c.aws" : "10.12.212.64/27",
    "wutrni-wkl-npd-002.sub.euwe2c.aws" : "10.12.212.192/27",
  }
}


enable_dhcp_options = true

enable_nat_gateway = false

one_nat_gateway_per_az = true

# Route53
enable_dns_hostnames = "true"

route53_domain_name = "wutrni-wkl-npd.euwe2.aws"

route53_name_internal_tld = "internal"

