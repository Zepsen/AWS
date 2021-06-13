resource "aws_iam_user_group_membership" "user_group_membership" {
  user   = var.user
  groups = var.groups
}
