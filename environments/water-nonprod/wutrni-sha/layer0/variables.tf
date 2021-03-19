# Deployment definition
variable "aws_region" {
  description = "AWS region into which to deploy AWS resources."
  type        = string
}

variable "tags" {
  type = map(any)
}

# AWS provider
variable "aws_account_id" {
  description = "Whitelisted AWS Account ID to avoid unintended modification of the wrong environment."
  type        = string
}

# VPC
variable "vpc_cidr_range" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "CIDR ranges to define each public subnet."
  type        = map(any)
  default     = {}
}

variable "private_subnets" {
  description = "CIDR ranges to define each private subnet."
  type        = map(any)
  default     = {}
}

variable "shared_subnets" {
  description = "CIDR ranges to define each shared subnet."
  type        = list(any)
  default     = []
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC."
  type        = string
}

variable "enable_dhcp_options" {
  description = "Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type"
  type        = string
}

variable "default_route_table_routes" {
  description = "List of default route table routes"
  type        = list(map(string))
  default     = []
}

variable "route53_domain_name" {
  description = "Domain name of this hosted zone."
  default     = ""
  type        = string
}

variable "route53_name_internal_tld" {
  description = "TLD for the internal hosted zone."
  type        = string
}

variable "route53_name_external_tld" {
  description = "TLD for the external hosted zone."
  type        = string
  default     = ""
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`."
  default     = false
}

variable "enable_dynamodb_endpoint" {
  description = "Should be true if you want to provision a DynamoDB endpoint to the VPC"
  default     = false
}

variable "dhcp_domain_name_servers" {
  description = "Specify a list of DNS server addresses for DHCP options set, default to AWS provided"
  default     = ["AmazonProvidedDNS"]
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = false
}

variable "dhcp_domain_name" {
  description = "Specifies DNS name for DHCP options set"
  default     = ""
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = true
}

variable "enable_s3_endpoint" {
  description = "Should be true if you want to provision an S3 endpoint to the VPC"
  default     = false
}

variable "enable_vpn_gateway" {
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  default     = true
}

variable "vpn_gateway_amazon_side_asn" {
  description = "The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the virtual private gateway is created with the current default Amazon ASN."
  default     = "64512"
}

