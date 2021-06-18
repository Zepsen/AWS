resource "aws_s3_bucket_object" "index" {
  key          = var.key
  bucket       = var.bucket
  source       = var.source_path
  etag         = filemd5(var.etag)
  content_type = var.content_type
}
