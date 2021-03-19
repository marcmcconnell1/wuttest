terraform {
  required_version = "= 0.14.8"

  backend "s3" {
    region         = "eu-west-2"
    bucket         = "wutrni-sha-npd-tfstate.s3.euwe2.aws"
    key            = "test_instance/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform-state-locks_sha"
  }
}

provider "aws" {
  version             = "~> 2.1"
  allowed_account_ids = [var.aws_account_id]
  region              = var.aws_region
}

data "terraform_remote_state" "layer0" {
  backend = "s3"

  config = {
    bucket = "wutrni-sha-npd-tfstate.s3.euwe2.aws"
    region = "eu-west-2"
    key    = "layer0/terraform.tfstate"
  }
}

data "aws_subnet" "trtst_subnet" {
  id = var.subnet_id
}

module "trtst_node0" {
  source          = "../../../modules/components/transport_test_instance"
  region          = data.terraform_remote_state.layer0.outputs.aws_region
  vpc_id          = data.terraform_remote_state.layer0.outputs.vpc_id
  vpc_cidr_range  = data.terraform_remote_state.layer0.outputs.vpc_cidr_range
  subnet_id       = "subnet-0a7b299cf7ff0ca21"
  trtst_hostname  = "awssstrtst001"
  private_ip      = "10.12.204.5"
  security_groups = [aws_security_group.trtst_sg.id]
  instance_type   = "t2.micro"
  key_name        = "test-mm"
  tags            = data.terraform_remote_state.layer0.outputs.tags
}
