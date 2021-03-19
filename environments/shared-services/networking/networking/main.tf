terraform {

  backend "s3" {
    bucket         = "crpept-arq-prd-tfstate.s3.euwe2.aws"
    encrypt        = true
    key            = "account/terraform.tfstate"
    dynamodb_table = "terraform-state-locks_arq"
    region         = "eu-west-2"
  }

  required_version = "= 0.14.8"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.account_id]
}

provider "aws" {
  alias               = "replication"
  region              = var.replication_region
  allowed_account_ids = [var.account_id]
}

data "aws_iam_role" "administratoraccess" {
  name = var.sysadmin_role
}

module "s3_remote_state" {
  source = "../../../../modules/components/s3-remote-state"

  primary_region = var.aws_region
  tags           = var.tags
}

module "s3_bucket_restriction" {
  source = "git@github.com:arqiva-cs/tf-mod-aws-s3-restricted-bucket-policy.git?ref=v1.2"

  account_id  = var.account_id
  bucket_name = module.s3_remote_state.state_bucket

  iam_roles_ids = concat(
    module.s3_remote_state.iam_role_ids,
    [data.aws_iam_role.administratoraccess.unique_id],
  )
}

module "s3_replication_bucket_restriction" {
  providers = {
    aws = aws.replication
  }

  source = "git@github.com:arqiva-cs/tf-mod-aws-s3-restricted-bucket-policy.git?ref=v1.2"

  account_id  = var.account_id
  bucket_name = module.s3_remote_state.replication_state_bucket

  iam_roles_ids = concat(
    module.s3_remote_state.iam_role_ids,
    [data.aws_iam_role.administratoraccess.unique_id],
  )
}
