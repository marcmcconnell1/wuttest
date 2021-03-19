variable "region" {
  description = "The aws region"
  default     = "eu-west-1"
}

variable "route53_domain_name" {
  description = "The Domain Name used in our DNS records."
  type        = string
}

variable "route53_name_internal_tld" {
  description = "The TLD used to access Core services internally."
  type        = string
}

variable "manage_default_route_table" {
  description = "Should be true to manage default route table"
  type        = string
  default     = false
}

variable "default_route_table_routes" {
  description = "Configuration block of routes. See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table#route"
  type        = list(map(string))
  default     = []
}

variable "availability_zones" {
  description = "A list of possible availability zones."
  type        = list(string)
  default     = []
}

variable "vpc" {
  description = "Keep existing EIP's when rebuilding the vpc"
  default     = true
}

variable "requires_eip" {
  description = "Should be false if you do not need EIP's in your VPC"
  default     = false
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`."
  default     = true
}

variable "vpc_name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "enable_s3_endpoint" {
  description = "Should be true if you want to provision an S3 endpoint to the VPC"
  default     = false
}

variable "enable_ec2messages_endpoint" {
  description = "Should be true if you want to provision an EC2MESSAGES endpoint to the VPC"
  default     = false
}

variable "enable_ec2_endpoint" {
  description = "Should be true if you want to provision an EC2 endpoint to the VPC"
  default     = false
}

variable "enable_ssm_endpoint" {
  description = "Should be true if you want to provision an SSM endpoint to the VPC"
  default     = false
}

variable "enable_ssmmessages_endpoint" {
  description = "Should be true if you want to provision an SSM Messages endpoint to the VPC"
  default     = false
}

variable "enable_sns_endpoint" {
  description = "Should be true if you want to provision an SNS endpoint to the VPC"
  default     = false
}

variable "enable_sqs_endpoint" {
  description = "Should be true if you want to provision an SQS endpoint to the VPC"
  default     = false
}

variable "enable_kms_endpoint" {
  description = "Should be true if you want to provision an KMS endpoint to the VPC"
  default     = false
}

variable "kms_endpoint_private_dns_enabled" {
  description = "Whether or not to associate a private hosted zone with the specified VPC for KMS endpoint"
  type        = bool
  default     = true
}

variable "ssm_endpoint_private_dns_enabled" {
  description = "Whether or not to associate a private hosted zone with the specified VPC for SSM endpoint"
  type        = bool
  default     = true
}
variable "ssmmessages_endpoint_private_dns_enabled" {
  description = "Whether or not to associate a private hosted zone with the specified VPC for SSM Messages endpoint"
  type        = bool
  default     = true
}
variable "ec2_endpoint_private_dns_enabled" {
  description = "Whether or not to associate a private hosted zone with the specified VPC for Ec2 endpoint"
  type        = bool
  default     = true
}
variable "ec2messages_endpoint_private_dns_enabled" {
  description = "Whether or not to associate a private hosted zone with the specified VPC for EC2 Messages endpoint"
  type        = bool
  default     = true
}
variable "sns_endpoint_private_dns_enabled" {
  description = "Whether or not to associate a private hosted zone with the specified VPC for SNS endpoint"
  type        = bool
  default     = true
}
variable "sqs_endpoint_private_dns_enabled" {
  description = "Whether or not to associate a private hosted zone with the specified VPC for SQS endpoint"
  type        = bool
  default     = true
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = map(any)
  default     = {}
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = map(any)
  default     = {}
}

variable "enable_vpn_gateway" {
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  default     = true
}

variable "reuse_nat_ips" {
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  default     = true
}

variable "vpc_cidr" {
  description = "VPC CIDR block."
  type        = string
  default     = ""
}

variable "enable_dhcp_options" {
  description = "Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type"
  default     = true
}

variable "dhcp_domain_name" {
  description = "Specifies DNS name for DHCP options set"
  default     = ""
}

variable "dhcp_domain_name_servers" {
  description = "Specify a list of DNS server addresses for DHCP options set, default to AWS provided"
  default     = ["AmazonProvidedDNS"]
}

variable "dhcp_netbios_name_servers" {
  description = "Specify a list of netbios servers for DHCP options set"
  default     = []
}

variable "dhcp_netbios_node_type" {
  description = "Specify netbios node_type for DHCP options set"
  default     = ""
}

variable "dhcp_ntp_servers" {
  description = "Specify a list of NTP servers for DHCP options set"
  default     = []
}

variable "create_database_subnet_group" {
  description = "Controls if database subnet group should be created"
  default     = false
}

variable "database_subnets" {
  description = "A list of database subnets"
  default     = []
}

variable "database_subnet_tags" {
  description = "Additional tags for the database subnets"
  default     = {}
}

variable "enable_dynamodb_endpoint" {
  description = "Should be true if you want to provision a DynamoDB endpoint to the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = false
}

variable "private_propagating_vgws" {
  description = "A list of VGWs the private route table should propagate"
  default     = []
}

variable "public_propagating_vgws" {
  description = "A list of VGWs the public route table should propagate"
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  default     = true
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
}

variable "elasticache_subnets" {
  description = "A list of elasticache subnets"
  default     = []
}

######
# TAGS
######

variable "dhcp_tags" {
  description = "Additional tags for the DHCP option set"
  type        = map(any)

  default = {
    Role = "dhcp"
    Tier = "priv"
  }
}

variable "private_route_table_tags" {
  description = "Additional tags for the private route tables"
  type        = map(any)

  default = {
    Role = "private-route-table"
    Tier = "priv"
  }
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(any)

  default = {
    Role = "private-subnets"
    Tier = "priv"
  }
}

variable "public_route_table_tags" {
  description = "Additional tags for the public route tables"
  type        = map(any)

  default = {
    Role = "public-route-table"
    Tier = "pub"
  }
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(any)

  default = {
    Role = "public-subnets"
    Tier = "pub"
  }
}

variable "elasticache_subnet_tags" {
  description = "Additional tags for the elasticache subnets"
  default     = {}
}

variable "vpn_gateway_tags" {
  description = "Additional tags for the vpn gateway"
  type        = map(any)

  default = {
    Role = "vpn-gateway"
    Tier = "pub"
  }
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "propagate_private_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  default     = true
}

variable "propagate_public_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  default     = true
}

variable "vpn_gateway_id" {
  description = "ID of VPN Gateway to attach to the VPC"
  default     = ""
}

variable "vpn_gateway_amazon_side_asn" {
  description = "The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the virtual private gateway is created with the current default Amazon ASN."
  default     = "64512"
}

variable "shared_subnets" {
  description = "The list of shared subnets"
  type        = list(string)
  default     = []
}
