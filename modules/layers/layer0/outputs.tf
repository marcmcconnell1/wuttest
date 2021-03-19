output "aws_region" {
  description = "The AWS Region layer0 has been deployed to"
  value       = var.region
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = module.aws_vpc.default_network_acl_id
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = module.aws_vpc.default_route_table_id
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = module.aws_vpc.default_security_group_id
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = module.aws_vpc.igw_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.aws_vpc.private_subnets
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.aws_vpc.private_subnets_cidr_blocks
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.aws_vpc.public_subnets
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.aws_vpc.public_subnets_cidr_blocks
}

output "vgw_id" {
  description = "The ID of the VPN Gateway"
  value       = module.aws_vpc.vgw_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.aws_vpc.vpc_cidr_block
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.aws_vpc.vpc_id
}

output "tags" {
  value = var.tags
}
