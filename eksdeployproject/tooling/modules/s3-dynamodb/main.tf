resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket
  #region = var.main-region
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_versioning" "version" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_rule" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    id = "rule-1"

    filter {}

    status = "Enabled"

    transition {
      days          = 365
      storage_class = "GLACIER"
    }
    # expiration {
    #   days = 30
    # }
  }
}
resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}