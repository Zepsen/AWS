locals {
  alarms = {
    budget = {
      alarm_name          = "${local.alias}-monthly-alarm"
      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = "1"
      metric_name         = "EstimatedCharges"
      namespace           = "AWS/Billing"
      period              = "21600" # aws said min 6 hours.
      statistic           = "Maximum"
      threshold           = "10"
      alarm_description   = "Alarm to prevent overprices"
      dimensions = {
        "Currency" = "USD"
      }
    }
  }
}
