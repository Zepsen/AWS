module "full_access_ec2_role" {
  source = "../../modules/iam/role"

  name               = "${local.names.full_access_ec2}Role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

module "full_access_s3_role" {
  source = "../../modules/iam/role"

  name               = "${local.names.full_access_s3}Role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

module "read_only_s3_role" {
  source = "../../modules/iam/role"

  name               = "${local.names.read_only_access_s3}Role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

module "attach_full_access_ec2_role" {
  source = "../../modules/iam/attachments/role"

  role       = module.full_access_ec2_role.name
  policy_arn = module.full_access_ec2_policy.arn
}

module "attach_full_access_s3_role" {
  source = "../../modules/iam/attachments/role"

  role       = module.full_access_s3_role.name
  policy_arn = module.full_access_s3_policy.arn
}

module "attach_read_only_s3_role" {
  source = "../../modules/iam/attachments/role"

  role       = module.read_only_s3_role.name
  policy_arn = module.read_only_s3_policy.arn
}
