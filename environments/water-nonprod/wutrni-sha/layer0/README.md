## Requirements

| Name | Version |
|------|---------|
| terraform | = 0.14.8 |

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| layer0 | ../../../../modules/layers/layer0 |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_account\_id | Whitelisted AWS Account ID to avoid unintended modification of the wrong environment. | `string` | n/a | yes |
| aws\_region | AWS region into which to deploy AWS resources. | `string` | n/a | yes |
| default\_route\_table\_routes | List of default route table routes | `list(map(string))` | `[]` | no |
| dhcp\_domain\_name | Specifies DNS name for DHCP options set | `string` | `""` | no |
| dhcp\_domain\_name\_servers | Specify a list of DNS server addresses for DHCP options set, default to AWS provided | `list` | <pre>[<br>  "AmazonProvidedDNS"<br>]</pre> | no |
| enable\_dhcp\_options | Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type | `string` | n/a | yes |
| enable\_dns\_hostnames | Should be true to enable DNS hostnames in the VPC. | `string` | n/a | yes |
| enable\_dns\_support | Should be true to enable DNS support in the VPC | `bool` | `true` | no |
| enable\_dynamodb\_endpoint | Should be true if you want to provision a DynamoDB endpoint to the VPC | `bool` | `false` | no |
| enable\_nat\_gateway | Should be true if you want to provision NAT Gateways for each of your private networks | `bool` | `false` | no |
| enable\_s3\_endpoint | Should be true if you want to provision an S3 endpoint to the VPC | `bool` | `false` | no |
| enable\_vpn\_gateway | Should be true if you want to create a new VPN Gateway resource and attach it to the VPC | `bool` | `false` | no |
| one\_nat\_gateway\_per\_az | Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`. | `bool` | `false` | no |
| private\_subnets | CIDR ranges to define each private subnet. | `map(any)` | `{}` | no |
| public\_subnets | CIDR ranges to define each public subnet. | `map(any)` | `{}` | no |
| route53\_domain\_name | Domain name of this hosted zone. | `string` | `""` | no |
| route53\_name\_external\_tld | TLD for the external hosted zone. | `string` | `""` | no |
| route53\_name\_internal\_tld | TLD for the internal hosted zone. | `string` | n/a | yes |
| shared\_subnets | CIDR ranges to define each shared subnet. | `list(any)` | `[]` | no |
| single\_nat\_gateway | Should be true if you want to provision a single shared NAT Gateway across all of your private networks | `bool` | `true` | no |
| tags | n/a | `map(any)` | n/a | yes |
| vpc\_cidr\_range | The CIDR block for the VPC. | `string` | n/a | yes |
| vpn\_gateway\_amazon\_side\_asn | The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the virtual private gateway is created with the current default Amazon ASN. | `string` | `"64512"` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_account\_id | The ID of this account |
| private\_subnets | List of IDs of private subnets |
| private\_subnets\_cidr\_blocks | List of cidr\_blocks of private subnets |
| public\_subnets | List of IDs of public subnets |
| public\_subnets\_cidr\_blocks | List of cidr\_blocks of public subnets |
| tags | Generic tags for use across all Layers. |
| vpc\_cidr\_range | The CIDR block for the VPC. |
| vpc\_id | ID of the VPC |
