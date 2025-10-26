resource "random_id" "bucket_id" { byte_length = 4 }

resource "aws_s3_bucket" "storage" {
  bucket = "${var.bucket_name_prefix}-${random_id.bucket_id.hex}"

  tags = {
    Name        = "${var.bucket_name_prefix}-bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_ownership_controls" "storage_owner" {
  bucket = aws_s3_bucket.storage.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "storage" {
  bucket = aws_s3_bucket.storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "storage" {
  bucket = aws_s3_bucket.storage.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "storage" {
  bucket = aws_s3_bucket.storage.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}