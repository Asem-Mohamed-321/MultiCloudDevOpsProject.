Resource “aws_s3_bucket” “backend_state” {
  bucket = “backend_state”
}


Resource “aws_s3_bucket_versioning” {
  bucket = aws_s3_bucket.backend_state.id
  versioning_configuration {
    status = “Enabled”
  }
}


Resource “aws_dynamodb_table” “terraform_lock” {
  name = “final-project-lock”
  billing_mode = ‘PAY_PER_REQUEST’
  hash_key = ‘LockID’
  attribute {
    name = “LockID”
    type = “s”
  }
}
