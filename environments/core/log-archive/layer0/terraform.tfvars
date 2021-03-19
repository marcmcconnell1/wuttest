# Deployment definition
aws_region = "eu-west-2"

tags = {
  owner          = "crp"
  solution       = "log"
  tenant         = "arq"
  environment    = "prd"
  project_region = "euwe2"
  provider       = "aws"
}

# AWS Provider
# log-archive
aws_account_id = "991679877872"


# VPC
###########################################
vpc_cidr_range = "10.12.192.0/23" ##
###########################################
private_subnets = {
  "eu-west-2a" : {
    "crplog-arq-prd-001.sub.euwe2a.aws" : "10.12.192.0/27",
    "crplog-arq-prd-002.sub.euwe2a.aws" : "10.12.192.128/27",
  },
  "eu-west-2b" : {
    "crplog-arq-prd-001.sub.euwe2b.aws" : "10.12.192.32/27",
    "crplog-arq-prd-002.sub.euwe2b.aws" : "10.12.192.160/27",
  },
  "eu-west-2c" : {
    "crplog-arq-prd-001.sub.euwe2c.aws" : "10.12.192.64/27",
    "crplog-arq-prd-002.sub.euwe2c.aws" : "10.12.192.192/27",
  }
}


enable_dhcp_options = true

enable_nat_gateway = false

one_nat_gateway_per_az = true

# Route53
enable_dns_hostnames = "true"

route53_domain_name = "crplog-arq-prd.euwe2.aws"

route53_name_internal_tld = "internal"

