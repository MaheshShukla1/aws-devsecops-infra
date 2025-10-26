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
