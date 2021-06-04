resource "aws_budgets_budget" "budget" {
  name              = var.name
  budget_type       = var.budget_type
  limit_amount      = var.limit_amount
  limit_unit        = var.limit_unit
  time_period_end   = var.time_period_end
  time_period_start = var.time_period_start
  time_unit         = var.time_unit

  cost_filters = {
    Service = "Amazon Elastic Compute Cloud - Compute"
  }

  dynamic "notification" {
    for_each = var.notifications
    content {
      threshold                 = notification.value.threshold
      comparison_operator       = notification.value.comparison_operator
      threshold_type            = notification.value.threshold_type
      notification_type         = notification.value.notification_type
      subscriber_sns_topic_arns = notification.value.subscriber_sns_topic_arns
    }
  }
}
