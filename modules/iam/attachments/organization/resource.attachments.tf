resource "aws_organizations_policy_attachment" "restrict_regions_on_root" {
  policy_id = var.policy_id
  target_id = var.target_id
}
