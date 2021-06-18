resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  acl    = var.acl
  policy = file("../../modules/s3/bucket-static-web/policy.json")

  website {
    index_document = var.index_document
    error_document = var.error_document
  }
}
