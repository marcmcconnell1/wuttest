output "readonly_user_arn" {
  value = aws_iam_user.tf_state.arn
}

output "state_bucket" {
  value = aws_s3_bucket.tf_state_primary.id
}

output "state_bucket_arn" {
  value = aws_s3_bucket.tf_state_primary.arn
}

output "replication_state_bucket" {
  value = aws_s3_bucket.tf_state_replication.id
}

output "replication_state_bucket_arn" {
  value = aws_s3_bucket.tf_state_replication.arn
}

output "state_lock_table" {
  value = aws_dynamodb_table.tf_state_lock.id
}

output "state_lock_table_arn" {
  value = aws_dynamodb_table.tf_state_lock.arn
}

output "iam_role_ids" {
  value = [aws_iam_role.replication.unique_id, aws_iam_user.tf_state.unique_id]
}
