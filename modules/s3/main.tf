resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket = "avengers-bucket-${random_id.suffix.hex}"
  acl    = "private"
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}
