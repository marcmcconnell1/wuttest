## Requirements

| Name | Version |
|------|---------|
| terraform | = 0.14.8 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| s3_bucket_restriction | git@github.com:arqiva-cs/tf-mod-aws-s3-restricted-bucket-policy.git?ref=v1.2 |  |
| s3_remote_state | ../../../../modules/components/s3-remote-state |  |
| s3_replication_bucket_restriction | git@github.com:arqiva-cs/tf-mod-aws-s3-restricted-bucket-policy.git?ref=v1.2 |  |

## Resources

| Name |
|------|
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | n/a | `any` | n/a | yes |
| aws\_region | n/a | `any` | n/a | yes |
| replication\_region | n/a | `any` | n/a | yes |
| sysadmin\_role | n/a | `any` | n/a | yes |
| tags | n/a | `any` | n/a | yes |

## Outputs

No output.
