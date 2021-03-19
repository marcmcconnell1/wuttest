# Deployment definition
aws_region = "eu-west-2"

tags = {
  owner          = "crp"
  solution       = "aud"
  tenant         = "arq"
  environment    = "prd"
  project_region = "euwe2"
  provider       = "aws"
}

# AWS Provider
aws_account_id = "471495814564"


# VPC
###########################################
vpc_cidr_range = "10.12.194.0/23" ##
###########################################
private_subnets = {
  "eu-west-2a" : {
    "crpaud-arq-prd-001.sub.euwe2a.aws" : "10.12.194.0/27",
    "crpaud-arq-prd-002.sub.euwe2a.aws" : "10.12.194.128/27",
  },
  "eu-west-2b" : {
    "crpaud-arq-prd-001.sub.euwe2b.aws" : "10.12.194.32/27",
    "crpaud-arq-prd-002.sub.euwe2b.aws" : "10.12.194.160/27",
  },
  "eu-west-2c" : {
    "crpaud-arq-prd-001.sub.euwe2c.aws" : "10.12.194.64/27",
    "crpaud-arq-prd-002.sub.euwe2c.aws" : "10.12.194.192/27",
  }
}


enable_dhcp_options = true

enable_nat_gateway = false

one_nat_gateway_per_az = true

# Route53
enable_dns_hostnames = "true"

route53_domain_name = "crpaud-arq-prd.euwe2.aws"

route53_name_internal_tld = "internal"

