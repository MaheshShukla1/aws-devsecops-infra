output "storage_bucket_name" { value = aws_s3_bucket.storage.id }
output "storage_bucket_owner" { value = aws_s3_bucket_ownership_controls.storage_owner.object_ownership }
