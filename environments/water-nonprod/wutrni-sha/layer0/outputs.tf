output "aws_region" {
  description = "The region of this account"
  value       = module.layer0.aws_region
}
output "aws_account_id" {
  description = "The ID of this account"
  value       = var.aws_account_id
}
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.layer0.vpc_id
}

output "vpc_cidr_range" {
  description = "The CIDR block for the VPC."
  value       = module.layer0.vpc_cidr_block
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.layer0.public_subnets
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.layer0.public_subnets_cidr_blocks
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.layer0.private_subnets
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.layer0.private_subnets_cidr_blocks
}

output "tags" {
  description = "Generic tags for use across all Layers."
  value       = module.layer0.tags
}

