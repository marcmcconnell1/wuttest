variable "replication_region" {
  default     = "eu-central-1"
  description = "AWS to launch the replication bucket in"
}

variable "primary_region" {
  default     = "eu-west-2"
  description = "AWS to launch the primary tf state bucket in"
}

variable "tags" {}
