resource "aws_iam_role_policy_attachment" "policy_attachments" {
  role       = var.role
  policy_arn = var.policy_arn
}
