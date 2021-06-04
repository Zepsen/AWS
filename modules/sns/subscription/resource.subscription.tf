resource "aws_sns_topic_subscription" "main_email_target" {
  topic_arn = var.topic_arn
  protocol  = var.protocol
  endpoint  = var.endpoint
}
