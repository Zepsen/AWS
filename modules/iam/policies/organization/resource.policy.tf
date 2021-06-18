resource "aws_organizations_policy" "restrict_regions" {
  name        = var.name
  description = var.description
  content     = var.content
}
