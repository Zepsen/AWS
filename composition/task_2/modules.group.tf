module "coordinators_group" {
  source = "../../modules/iam/groups"
  name   = "Coordinators"
}

module "mentors_group" {
  source = "../../modules/iam/groups"
  name   = "Mentors"
}

module "mentees_group" {
  source = "../../modules/iam/groups"
  name   = "Mentees"
}


module "full_access_ec2_group" {
  source = "../../modules/iam/groups"
  name   = "${local.names.full_access_ec2}Group"
}

module "full_access_s3_group" {
  source = "../../modules/iam/groups"
  name   = "${local.names.full_access_s3}Group"
}

module "read_only_s3_group" {
  source = "../../modules/iam/groups"
  name   = "${local.names.read_only_access_s3}Group"
}

module "attach_policy_to_full_access_ec2_group" {
  source     = "../../modules/iam/attachments/group"
  group      = module.full_access_ec2_group.name
  policy_arn = module.full_access_ec2_policy.arn
}

module "attach_policy_to_full_access_s3_group" {
  source     = "../../modules/iam/attachments/group"
  group      = module.full_access_s3_group.name
  policy_arn = module.full_access_s3_policy.arn
}

module "attach_policy_to_read_only_s3_group" {
  source     = "../../modules/iam/attachments/group"
  group      = module.read_only_s3_group.name
  policy_arn = module.read_only_s3_policy.arn
}
