data "aws_iam_policy_document" "full_access_ec2" {
  statement {
    sid = "1"
    actions = [
      "ec2:*"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "full_access_s3" {
  statement {
    sid = "1"
    actions = [
      "s3:*"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "read_only_s3" {
  statement {
    sid = "1"
    actions = [
      "s3:ListBucket",
      "s3:GetObject*"
    ]
    resources = ["*"]
  }
}
