module "aws_organizations_policy_restrict_regions" {
  source      = "../../../modules/iam/policies/organization"
  name        = local.scp.name
  description = local.scp.description
  content     = data.aws_iam_policy_document.restrict_regions.json
}

module "aws_organizations_policy_attachment_restrict_regions_on_root" {
  source    = "../../../modules/iam/attachments/organization"
  policy_id = module.aws_organizations_policy_restrict_regions.id
  target_id = data.aws_caller_identity.this.id
}
