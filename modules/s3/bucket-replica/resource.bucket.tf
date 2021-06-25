resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  acl    = var.acl

  versioning {
    enabled = var.versioning_enabled
  }

  replication_configuration {
    role = var.role_arn

    rules {
      id     = "replica"
      prefix = ""
      status = "Enabled"

      destination {
        bucket        = var.destination_bucket
        storage_class = "STANDARD"
      }
    }
  }
}
