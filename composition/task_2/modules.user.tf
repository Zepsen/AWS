module "ec2_user" {
  source = "../../modules/iam/users"
  name   = "${local.names.full_access_ec2}User"
}

module "s3_user" {
  source = "../../modules/iam/users"
  name   = "${local.names.full_access_s3}User"
}

module "ro_s3_user" {
  source = "../../modules/iam/users"
  name   = "${local.names.read_only_access_s3}User"
}

module "add_user_ec2" {
  source = "../../modules/iam/groups_membership"
  user   = module.ec2_user.name
  groups = [module.full_access_ec2_group.name]
}

module "add_user_s3" {
  source = "../../modules/iam/groups_membership"
  user   = module.s3_user.name
  groups = [module.full_access_s3_group.name]
}
module "add_user_ro_s3" {
  source = "../../modules/iam/groups_membership"
  user   = module.ro_s3_user.name
  groups = [module.read_only_s3_group.name]
}
