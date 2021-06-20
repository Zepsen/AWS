module "s3-static" {
  source = "../../modules/s3/bucket-static-web"

  bucket = "${var.alias}-s3bucket-static-web"
  acl    = "public-read"
}

module "aws_s3_bucket_object_index" {
  source = "../../modules/s3/bucket-object"

  key          = "index.html"
  bucket       = module.s3-static.id
  source_path  = "../../modules/s3/bucket-static-web/site/index.html"
  etag         = "../../modules/s3/bucket-static-web/site/index.html"
  content_type = "text/html"
}

module "aws_s3_bucket_object_css" {
  source = "../../modules/s3/bucket-object"

  key          = "style.css"
  bucket       = module.s3-static.id
  source_path  = "../../modules/s3/bucket-static-web/site/style.css"
  etag         = "../../modules/s3/bucket-static-web/site/style.css"
  content_type = "text/css"
}

module "aws_s3_bucket_object_error" {
  source = "../../modules/s3/bucket-object"

  key          = "error.html"
  bucket       = module.s3-static.id
  source_path  = "../../modules/s3/bucket-static-web/site/error.html"
  etag         = "../../modules/s3/bucket-static-web/site/error.html"
  content_type = "text/html"
}

module "replica_role" {
  source = "../../modules/iam/role"

  name               = "${var.alias}S3ReplicaRole"
  path               = "/service-role/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

module "replica_policy" {
  source = "../../modules/iam/policies/policy"

  name        = "${var.alias}S3ReplicaPolicy"
  description = "Full access EC2 policy"

  policy = data.aws_iam_policy_document.replica_policy.json
}

module "attach_replica_role_policy" {
  source = "../../modules/iam/attachments/role"

  role       = module.replica_role.name
  policy_arn = module.replica_policy.arn
}

module "s3-with-replica" {
  source = "../../modules/s3/bucket-replica"

  bucket             = "${var.alias}-s3bucket-replica-2"
  versioning_enabled = true

  role_arn           = module.replica_role.arn
  destination_bucket = module.s3.arn
}

module "s3" {
  source = "../../modules/s3/bucket"

  providers = {
    aws = aws.secondary
  }

  bucket             = "${var.alias}-s3bucket-2"
  versioning_enabled = true
}
