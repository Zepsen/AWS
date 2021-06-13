data "aws_iam_policy_document" "sns_topic_policy" {

  statement {
    sid    = "AWSSNSPublishingPermissions"
    effect = "Allow"

    actions = [
      "SNS:Receive",
      "SNS:Publish"
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      module.sns_topic.arn
    ]
  }
}
