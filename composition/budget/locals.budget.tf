locals {
  budget = {
    name              = "${local.alias}-monthly-budget"
    budget_type       = "COST"
    limit_amount      = "10"
    limit_unit        = "USD"
    time_period_end   = "2027-06-15_00:00"
    time_period_start = "2017-07-01_00:00"
    time_unit         = "MONTHLY"

    notifications = [
      {
        threshold                  = 100
        comparison_operator        = "GREATER_THAN"
        threshold_type             = "PERCENTAGE"
        notification_type          = "FORECASTED"
        subscriber_sns_topic_arns  = [module.sns_topic.arn]
      },
      {
        threshold                  = 80
        comparison_operator        = "GREATER_THAN"
        threshold_type             = "PERCENTAGE"
        notification_type          = "FORECASTED"
        subscriber_sns_topic_arns  = [module.sns_topic.arn]
      },
      {
        threshold                  = 60
        comparison_operator        = "GREATER_THAN"
        threshold_type             = "PERCENTAGE"
        notification_type          = "FORECASTED"
        subscriber_sns_topic_arns  = [module.sns_topic.arn]
      },
      {
        threshold                  = 40
        comparison_operator        = "GREATER_THAN"
        threshold_type             = "PERCENTAGE"
        notification_type          = "FORECASTED"
        subscriber_sns_topic_arns  = [module.sns_topic.arn]
      },
      {
        threshold                  = 20
        comparison_operator        = "GREATER_THAN"
        threshold_type             = "PERCENTAGE"
        notification_type          = "FORECASTED"
        subscriber_sns_topic_arns  = [module.sns_topic.arn]
      },
    ]

  }
}
