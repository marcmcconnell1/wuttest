variable "aws_region" {
  description = "AWS region into which to deploy AWS resources."
  type        = string
}

variable "aws_account_id" {
  description = "Whitelisted AWS Account ID to avoid unintended modification of the wrong environment."
  type        = string
}

variable "environment" {
  description = "Used to build names and tags for resources in this project. May be overridden by workspace name."
  type        = string
}

variable "project" {
  description = "Used to build names and tags for resources in this project."
  type        = string
}

variable "subnet_id" {
  description = "A subnet ID for the server to go on"
  type        = string
}