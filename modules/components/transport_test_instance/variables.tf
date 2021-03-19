variable "vpc_id" {
  description = "VPC into which the infrastructure will be depolyed."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign"
  type        = map
  default     = {}
}

variable "vpc_cidr_range" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "subnet_id" {
  description = "A subnet ID for the server to go on"
  type        = string
}

variable "instance_type" {
  description = "The EC2 type for the trtst server"
  type        = string
}

variable "region" {
  description = "Region the trtst instance will be deployed into."
}

variable "os_volume_size" {
  default = "41"
}

variable "extra_volume_size" {
  default = "10"
}

variable "trtst_hostname" {
  description = "Hostname for the trtst instance."
}

variable "key_name" {
  description = "The SSH key used to get the trtst password from the UI"
  type        = string
  default     = null
}

variable "security_groups" {
  description = "A list of SGs to apply to this instance"
  type        = list
  default     = []
}

variable "private_ip" {
  description = "A private IP to give this server"
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "A KMS key ID used to encrypt the EBS and root volumes"
  type        = string
  default     = null
}

variable "cloudwatch_retention_in_days" {
  description = "Number of days to keep the CW logs for this host"
  type        = string
  default     = "365"
}
