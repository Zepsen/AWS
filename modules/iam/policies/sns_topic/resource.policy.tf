resource "aws_sns_topic_policy" "account_billing_alarm_policy" {
  arn    = var.arn
  policy = var.policy
}
