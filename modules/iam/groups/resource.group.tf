resource "aws_iam_group" "group" {
  name = var.name
  path = "/users/"
}