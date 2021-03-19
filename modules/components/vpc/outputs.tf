output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.this.*.id, [""])[0]
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = concat(aws_vpc.this.*.arn, [""])[0]
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = concat(aws_vpc.this.*.cidr_block, [""])[0]
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = concat(aws_vpc.this.*.default_security_group_id, [""])[0]
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = concat(aws_vpc.this.*.default_network_acl_id, [""])[0]
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = concat(aws_vpc.this.*.default_route_table_id, [""])[0]
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = concat(aws_vpc.this.*.instance_tenancy, [""])[0]
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = concat(aws_vpc.this.*.enable_dns_support, [""])[0]
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = concat(aws_vpc.this.*.enable_dns_hostnames, [""])[0]
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = concat(aws_vpc.this.*.main_route_table_id, [""])[0]
}

output "vpc_secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks of the VPC"
  value       = [for ip in aws_vpc_ipv4_cidr_block_association.this : ip.cidr_block]
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = concat([for vp in aws_vpc.this : vp.owner_id], [""])[0]
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = [for sn in aws_subnet.private : sn.id]
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = [for sn in aws_subnet.private : sn.arn]
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = [for sn in aws_subnet.private : sn.cidr_block]
}


output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = [for sn in aws_subnet.public : sn.id]
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = [for sn in aws_subnet.public : sn.arn]
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = [for sn in aws_subnet.public : sn.cidr_block]
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = concat(aws_internet_gateway.this.*.id, [""])[0]
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = concat(aws_internet_gateway.this.*.arn, [""])[0]
}

output "egress_only_internet_gateway_id" {
  description = "The ID of the egress only Internet Gateway"
  value       = concat(aws_egress_only_internet_gateway.this.*.id, [""])[0]
}

output "cgw_ids" {
  description = "List of IDs of Customer Gateway"
  value       = [for k, v in aws_customer_gateway.this : v.id]
}

output "cgw_arns" {
  description = "List of ARNs of Customer Gateway"
  value       = [for k, v in aws_customer_gateway.this : v.arn]
}

output "this_customer_gateway" {
  description = "Map of Customer Gateway attributes"
  value       = aws_customer_gateway.this
}

output "vgw_id" {
  description = "The ID of the VPN Gateway"
  value = concat(
    aws_vpn_gateway.this.*.id,
    aws_vpn_gateway_attachment.this.*.vpn_gateway_id,
    [""],
  )[0]
}

output "vgw_arn" {
  description = "The ARN of the VPN Gateway"
  value       = concat(aws_vpn_gateway.this.*.arn, [""])[0]
}

output "default_vpc_id" {
  description = "The ID of the Default VPC"
  value       = concat(aws_default_vpc.this.*.id, [""])[0]
}

output "default_vpc_arn" {
  description = "The ARN of the Default VPC"
  value       = concat(aws_default_vpc.this.*.arn, [""])[0]
}

output "default_vpc_cidr_block" {
  description = "The CIDR block of the Default VPC"
  value       = concat(aws_default_vpc.this.*.cidr_block, [""])[0]
}

output "default_vpc_default_security_group_id" {
  description = "The ID of the security group created by default on Default VPC creation"
  value       = concat(aws_default_vpc.this.*.default_security_group_id, [""])[0]
}

output "default_vpc_default_network_acl_id" {
  description = "The ID of the default network ACL of the Default VPC"
  value       = concat(aws_default_vpc.this.*.default_network_acl_id, [""])[0]
}

output "default_vpc_default_route_table_id" {
  description = "The ID of the default route table of the Default VPC"
  value       = concat(aws_default_vpc.this.*.default_route_table_id, [""])[0]
}

output "default_vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within Default VPC"
  value       = concat(aws_default_vpc.this.*.instance_tenancy, [""])[0]
}

output "default_vpc_enable_dns_support" {
  description = "Whether or not the Default VPC has DNS support"
  value       = concat(aws_default_vpc.this.*.enable_dns_support, [""])[0]
}

output "default_vpc_enable_dns_hostnames" {
  description = "Whether or not the Default VPC has DNS hostname support"
  value       = concat(aws_default_vpc.this.*.enable_dns_hostnames, [""])[0]
}

output "default_vpc_main_route_table_id" {
  description = "The ID of the main route table associated with the Default VPC"
  value       = concat(aws_default_vpc.this.*.main_route_table_id, [""])[0]
}

output "public_network_acl_id" {
  description = "ID of the public network ACL"
  value       = concat(aws_network_acl.public.*.id, [""])[0]
}

output "public_network_acl_arn" {
  description = "ARN of the public network ACL"
  value       = concat(aws_network_acl.public.*.arn, [""])[0]
}

output "private_network_acl_id" {
  description = "ID of the private network ACL"
  value       = concat(aws_network_acl.private.*.id, [""])[0]
}

output "private_network_acl_arn" {
  description = "ARN of the private network ACL"
  value       = concat(aws_network_acl.private.*.arn, [""])[0]
}


# VPC flow log
output "vpc_flow_log_id" {
  description = "The ID of the Flow Log resource"
  value       = concat(aws_flow_log.this.*.id, [""])[0]
}

output "vpc_flow_log_destination_arn" {
  description = "The ARN of the destination for VPC Flow Logs"
  value       = local.flow_log_destination_arn
}

output "vpc_flow_log_destination_type" {
  description = "The type of the destination for VPC Flow Logs"
  value       = var.flow_log_destination_type
}

output "vpc_flow_log_cloudwatch_iam_role_arn" {
  description = "The ARN of the IAM role used when pushing logs to Cloudwatch log group"
  value       = local.flow_log_iam_role_arn
}

# Static values (arguments)
output "azs" {
  description = "A list of availability zones specified as argument to this module"
  value       = var.azs
}

output "name" {
  description = "The name of the VPC specified as argument to this module"
  value       = var.name
}
