## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| aws_vpc | ../../components/vpc |  |

## Resources

| Name |
|------|
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zones | A list of possible availability zones. | `list(string)` | `[]` | no |
| create\_database\_subnet\_group | Controls if database subnet group should be created | `bool` | `false` | no |
| database\_subnet\_tags | Additional tags for the database subnets | `map` | `{}` | no |
| database\_subnets | A list of database subnets | `list` | `[]` | no |
| dhcp\_domain\_name | Specifies DNS name for DHCP options set | `string` | `""` | no |
| dhcp\_domain\_name\_servers | Specify a list of DNS server addresses for DHCP options set, default to AWS provided | `list` | <pre>[<br>  "AmazonProvidedDNS"<br>]</pre> | no |
| dhcp\_netbios\_name\_servers | Specify a list of netbios servers for DHCP options set | `list` | `[]` | no |
| dhcp\_netbios\_node\_type | Specify netbios node\_type for DHCP options set | `string` | `""` | no |
| dhcp\_ntp\_servers | Specify a list of NTP servers for DHCP options set | `list` | `[]` | no |
| dhcp\_tags | Additional tags for the DHCP option set | `map(any)` | <pre>{<br>  "Role": "dhcp",<br>  "Tier": "priv"<br>}</pre> | no |
| ec2\_endpoint\_private\_dns\_enabled | Whether or not to associate a private hosted zone with the specified VPC for Ec2 endpoint | `bool` | `true` | no |
| ec2messages\_endpoint\_private\_dns\_enabled | Whether or not to associate a private hosted zone with the specified VPC for EC2 Messages endpoint | `bool` | `true` | no |
| elasticache\_subnet\_tags | Additional tags for the elasticache subnets | `map` | `{}` | no |
| elasticache\_subnets | A list of elasticache subnets | `list` | `[]` | no |
| enable\_dhcp\_options | Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type | `bool` | `true` | no |
| enable\_dns\_hostnames | Should be true to enable DNS hostnames in the VPC | `bool` | `false` | no |
| enable\_dns\_support | Should be true to enable DNS support in the VPC | `bool` | `true` | no |
| enable\_dynamodb\_endpoint | Should be true if you want to provision a DynamoDB endpoint to the VPC | `bool` | `false` | no |
| enable\_ec2\_endpoint | Should be true if you want to provision an EC2 endpoint to the VPC | `bool` | `false` | no |
| enable\_ec2messages\_endpoint | Should be true if you want to provision an EC2MESSAGES endpoint to the VPC | `bool` | `false` | no |
| enable\_kms\_endpoint | Should be true if you want to provision an KMS endpoint to the VPC | `bool` | `false` | no |
| enable\_nat\_gateway | Should be true if you want to provision NAT Gateways for each of your private networks | `bool` | `true` | no |
| enable\_s3\_endpoint | Should be true if you want to provision an S3 endpoint to the VPC | `bool` | `false` | no |
| enable\_sns\_endpoint | Should be true if you want to provision an SNS endpoint to the VPC | `bool` | `false` | no |
| enable\_sqs\_endpoint | Should be true if you want to provision an SQS endpoint to the VPC | `bool` | `false` | no |
| enable\_ssm\_endpoint | Should be true if you want to provision an SSM endpoint to the VPC | `bool` | `false` | no |
| enable\_ssmmessages\_endpoint | Should be true if you want to provision an SSM Messages endpoint to the VPC | `bool` | `false` | no |
| enable\_vpn\_gateway | Should be true if you want to create a new VPN Gateway resource and attach it to the VPC | `bool` | `true` | no |
| instance\_tenancy | A tenancy option for instances launched into the VPC | `string` | `"default"` | no |
| kms\_endpoint\_private\_dns\_enabled | Whether or not to associate a private hosted zone with the specified VPC for KMS endpoint | `bool` | `true` | no |
| map\_public\_ip\_on\_launch | Should be false if you do not want to auto-assign public IP on launch | `bool` | `true` | no |
| one\_nat\_gateway\_per\_az | Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`. | `bool` | `true` | no |
| private\_propagating\_vgws | A list of VGWs the private route table should propagate | `list` | `[]` | no |
| private\_route\_table\_tags | Additional tags for the private route tables | `map(any)` | <pre>{<br>  "Role": "private-route-table",<br>  "Tier": "priv"<br>}</pre> | no |
| private\_subnet\_tags | Additional tags for the private subnets | `map(any)` | <pre>{<br>  "Role": "private-subnets",<br>  "Tier": "priv"<br>}</pre> | no |
| private\_subnets | A list of private subnets inside the VPC | `map(any)` | `{}` | no |
| propagate\_private\_route\_tables\_vgw | Should be true if you want route table propagation | `bool` | `true` | no |
| propagate\_public\_route\_tables\_vgw | Should be true if you want route table propagation | `bool` | `true` | no |
| public\_propagating\_vgws | A list of VGWs the public route table should propagate | `list` | `[]` | no |
| public\_route\_table\_tags | Additional tags for the public route tables | `map(any)` | <pre>{<br>  "Role": "public-route-table",<br>  "Tier": "pub"<br>}</pre> | no |
| public\_subnet\_tags | Additional tags for the public subnets | `map(any)` | <pre>{<br>  "Role": "public-subnets",<br>  "Tier": "pub"<br>}</pre> | no |
| public\_subnets | A list of public subnets inside the VPC | `map(any)` | `{}` | no |
| region | The aws region | `string` | `"eu-west-1"` | no |
| requires\_eip | Should be false if you do not need EIP's in your VPC | `bool` | `false` | no |
| reuse\_nat\_ips | Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external\_nat\_ip\_ids' variable | `bool` | `true` | no |
| route53\_domain\_name | The Domain Name used in our DNS records. | `string` | n/a | yes |
| route53\_name\_internal\_tld | The TLD used to access Core services internally. | `string` | n/a | yes |
| shared\_subnets | The list of shared subnets | `list(string)` | `[]` | no |
| single\_nat\_gateway | Should be true if you want to provision a single shared NAT Gateway across all of your private networks | `bool` | `false` | no |
| sns\_endpoint\_private\_dns\_enabled | Whether or not to associate a private hosted zone with the specified VPC for SNS endpoint | `bool` | `true` | no |
| sqs\_endpoint\_private\_dns\_enabled | Whether or not to associate a private hosted zone with the specified VPC for SQS endpoint | `bool` | `true` | no |
| ssm\_endpoint\_private\_dns\_enabled | Whether or not to associate a private hosted zone with the specified VPC for SSM endpoint | `bool` | `true` | no |
| ssmmessages\_endpoint\_private\_dns\_enabled | Whether or not to associate a private hosted zone with the specified VPC for SSM Messages endpoint | `bool` | `true` | no |
| tags | A map of tags to add to all resources | `map` | `{}` | no |
| vpc | Keep existing EIP's when rebuilding the vpc | `bool` | `true` | no |
| vpc\_cidr | VPC CIDR block. | `string` | `""` | no |
| vpc\_name | Name to be used on all the resources as identifier | `string` | `""` | no |
| vpc\_tags | Additional tags for the VPC | `map` | `{}` | no |
| vpn\_gateway\_amazon\_side\_asn | The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the virtual private gateway is created with the current default Amazon ASN. | `string` | `"64512"` | no |
| vpn\_gateway\_id | ID of VPN Gateway to attach to the VPC | `string` | `""` | no |
| vpn\_gateway\_tags | Additional tags for the vpn gateway | `map(any)` | <pre>{<br>  "Role": "vpn-gateway",<br>  "Tier": "pub"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| default\_network\_acl\_id | The ID of the default network ACL |
| default\_route\_table\_id | The ID of the default route table |
| default\_security\_group\_id | The ID of the security group created by default on VPC creation |
| igw\_id | The ID of the Internet Gateway |
| nat\_ids | List of allocation ID of Elastic IPs created for AWS NAT Gateway |
| nat\_public\_ips | List of public Elastic IPs created for AWS NAT Gateway |
| natgw\_ids | List of NAT Gateway IDs |
| private\_route\_table\_ids | List of IDs of private route tables |
| private\_subnets | List of IDs of private subnets |
| private\_subnets\_cidr\_blocks | List of cidr\_blocks of private subnets |
| public\_route\_table\_ids | List of IDs of public route tables |
| public\_subnets | List of IDs of public subnets |
| public\_subnets\_cidr\_blocks | List of cidr\_blocks of public subnets |
| shared\_route\_table\_ids | List of the IDs of the shared route\_tables |
| shared\_subnets | List of IDs of shared subnets |
| shared\_subnets\_cidr\_blocks | List of cidr\_blocks of shared subnets |
| tags | n/a |
| vgw\_id | The ID of the VPN Gateway |
| vpc\_cidr\_block | The CIDR block of the VPC |
| vpc\_id | The ID of the VPC |
