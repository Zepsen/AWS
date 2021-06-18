module "full_access_ec2_policy" {
  source = "../../modules/iam/policies/policy"

  name        = "${local.names.full_access_ec2}Policy"
  description = "Full access EC2 policy"

  policy = data.aws_iam_policy_document.full_access_ec2.json
}

module "full_access_s3_policy" {
  source = "../../modules/iam/policies/policy"

  name        = "${local.names.full_access_s3}Policy"
  description = "Full access S3 policy"

  policy = data.aws_iam_policy_document.full_access_s3.json
}

module "read_only_s3_policy" {
  source = "../../modules/iam/policies/policy"

  name        = "${local.names.read_only_access_s3}Policy"
  description = "Read only S3 access policy"

  policy = data.aws_iam_policy_document.read_only_s3.json
}
