resource "aws_cloudwatch_log_group" "instance" {
  name = var.trtst_hostname

  retention_in_days = var.cloudwatch_retention_in_days

  tags = merge(var.tags, map("Name", var.trtst_hostname))
}
