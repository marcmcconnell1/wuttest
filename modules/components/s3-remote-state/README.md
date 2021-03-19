## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| aws.primary | n/a |
| aws.replication | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_dynamodb_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) |
| [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) |
| [aws_iam_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) |
| [aws_iam_user_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) |
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| primary\_region | AWS to launch the primary tf state bucket in | `string` | `"eu-west-2"` | no |
| replication\_region | AWS to launch the replication bucket in | `string` | `"eu-central-1"` | no |
| tags | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| iam\_role\_ids | n/a |
| readonly\_user\_arn | n/a |
| replication\_state\_bucket | n/a |
| replication\_state\_bucket\_arn | n/a |
| state\_bucket | n/a |
| state\_bucket\_arn | n/a |
| state\_lock\_table | n/a |
| state\_lock\_table\_arn | n/a |
