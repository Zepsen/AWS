module "s3" {
  source = "../../modules/s3/bucket"

  bucket             = "${var.alias}-s3bucket"
  versioning_enabled = true
}

module "aws_s3_bucket_object_text" {
  source = "../../modules/s3/bucket-object"

  key          = "text.txt"
  bucket       = module.s3.id
  source_path  = "../../modules/s3/bucket/text.txt"
  etag         = "../../modules/s3/bucket/text.txt"
  content_type = "text/plain"
}


# Webhost in s3
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
