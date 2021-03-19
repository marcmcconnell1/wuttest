data "aws_ami" "trtst" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn2-ami-hvm*",
    ]
  }
}

resource "aws_instance" "standalone" {
  ami                    = data.aws_ami.trtst.id
  instance_type          = var.instance_type
  monitoring             = true
  vpc_security_group_ids = var.security_groups
  subnet_id              = var.subnet_id
  private_ip             = var.private_ip
  key_name               = var.key_name

  root_block_device {
    volume_size = var.os_volume_size
    encrypted   = true
    volume_type = "gp2"
  }

  ebs_block_device {
    device_name = "/dev/sdh"
    volume_size = var.extra_volume_size
    encrypted   = true
    volume_type = "gp2"
  }

  tags        = merge(var.tags, map("Name", var.trtst_hostname))
  volume_tags = merge(var.tags, map("Name", var.trtst_hostname))
}
