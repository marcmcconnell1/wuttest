provider "aws" {
  alias  = "primary"
  region = var.primary_region
}

provider "aws" {
  alias  = "replication"
  region = var.replication_region
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "s3.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_role" "replication" {
  name = "tfstate_replication_${var.tags["tenant"]}"
  path = "/core/"

  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "replication" {
  statement {
    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.tf_state_primary.arn,
    ]
  }

  statement {
    actions = [
      "s3:GetObjectVersion",
      "s3:GetObjectVersionAcl",
    ]

    resources = [
      "${aws_s3_bucket.tf_state_primary.arn}/*",
    ]
  }

  statement {
    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete",
    ]

    resources = [
      "${aws_s3_bucket.tf_state_replication.arn}/*",
    ]
  }
}

resource "aws_iam_policy" "replication" {
  name = "tfstate_replication_${var.tags["tenant"]}"
  path = "/core/"

  policy = data.aws_iam_policy_document.replication.json
}

resource "aws_iam_policy_attachment" "replication" {
  name       = "tfstate_replication_${var.tags["tenant"]}"
  roles      = [aws_iam_role.replication.name]
  policy_arn = aws_iam_policy.replication.arn
}

resource "aws_s3_bucket" "tf_state_primary" {
  bucket   = "${var.tags["owner"]}${var.tags["solution"]}-${var.tags["tenant"]}-${var.tags["environment"]}-tfstate.s3.${var.tags["project_region"]}.${var.tags["provider"]}"
  acl      = "log-delivery-write"
  provider = aws.primary

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "${var.tags["owner"]}${var.tags["solution"]}-${var.tags["tenant"]}-${var.tags["environment"]}-tfstate.s3.${var.tags["project_region"]}.${var.tags["provider"]}"
    target_prefix = "logs/"
  }

  lifecycle_rule {
    prefix  = "logs/"
    enabled = true

    transition {
      days          = 90
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 180
    }
  }

  lifecycle_rule {
    prefix  = "account/terraform.tfstate"
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }
  }

  replication_configuration {
    role = aws_iam_role.replication.arn

    rules {
      id     = "replicate_states"
      prefix = ""
      status = "Enabled"

      destination {
        bucket        = aws_s3_bucket.tf_state_replication.arn
        storage_class = "STANDARD"
      }
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }

  tags = merge({ "Name" : "${var.tags["owner"]}${var.tags["solution"]}-${var.tags["tenant"]}-${var.tags["environment"]}-tfstate.s3.${var.tags["project_region"]}.${var.tags["provider"]}", "Role" : "tfstate" }, var.tags)

}

resource "aws_s3_bucket" "tf_state_replication" {
  bucket   = "${var.tags["owner"]}${var.tags["solution"]}-${var.tags["tenant"]}-${var.tags["environment"]}-tfstaterepl.s3.${var.tags["project_region"]}.${var.tags["provider"]}"
  acl      = "private"
  provider = aws.replication

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }

  tags = merge({ "Name" : "${var.tags["owner"]}${var.tags["solution"]}-${var.tags["tenant"]}-${var.tags["environment"]}-tfstate.s3.${var.tags["project_region"]}.${var.tags["provider"]}", "Role" : "tfstate" }, var.tags)

}

resource "aws_iam_user" "tf_state" {
  name = "terraform-state_${var.tags["tenant"]}"
  path = "/core/"
}

resource "aws_iam_user_policy" "s3_state_policy" {
  name   = "tfstate_readonly_access"
  user   = aws_iam_user.tf_state.name
  policy = data.aws_iam_policy_document.tf_state_readonly.json
}

data "aws_iam_policy_document" "tf_state_readonly" {
  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.tf_state_primary.arn,
    ]
  }

  statement {
    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.tf_state_primary.arn}/*",
    ]
  }

  statement {
    actions = [
      "s3:GetObject",
    ]

    effect = "Deny"

    resources = [
      "${aws_s3_bucket.tf_state_primary.arn}/logs/*",
    ]
  }
}

resource "aws_dynamodb_table" "tf_state_lock" {
  hash_key       = "LockID"
  name           = "terraform-state-locks_${var.tags["tenant"]}"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge({ "Name" : "terraform-state-locks_${var.tags["tenant"]}" }, var.tags)

}
