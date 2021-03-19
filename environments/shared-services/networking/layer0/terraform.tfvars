# Deployment definition
aws_region = "eu-west-2"

tags = {
  owner          = "crp"
  solution       = "ept"
  tenant         = "arq"
  environment    = "prd"
  project_region = "euwe2"
  provider       = "aws"
}

# AWS Provider
# Networking shared services
aws_account_id = "966339205240"


# VPC
###########################################
vpc_cidr_range = "10.12.200.0/22" ##
###########################################
private_subnets = {
  "eu-west-2a" : {
    "crpept-arq-prd-001.sub.euwe2a.aws" : "10.12.200.0/26",
    "crpept-arq-prd-002.sub.euwe2a.aws" : "10.12.201.0/26",
  },
  "eu-west-2b" : {
    "crpept-arq-prd-001.sub.euwe2b.aws" : "10.12.200.64/26",
    "crpept-arq-prd-002.sub.euwe2b.aws" : "10.12.201.64/26",
  },
  "eu-west-2c" : {
    "crpept-arq-prd-001.sub.euwe2c.aws" : "10.12.200.128/26",
    "crpept-arq-prd-002.sub.euwe2c.aws" : "10.12.201.128/26",
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

route53_domain_name = "crpept-arq-prd.euwe2.aws"

route53_name_internal_tld = "internal"

