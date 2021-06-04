module "monthly_alarm" {
  source              = "../../modules/alarms/"
  alarm_name          = local.alarms.budget.alarm_name
  comparison_operator = local.alarms.budget.comparison_operator
  evaluation_periods  = local.alarms.budget.evaluation_periods
  metric_name         = local.alarms.budget.metric_name
  namespace           = local.alarms.budget.namespace
  period              = local.alarms.budget.period
  statistic           = local.alarms.budget.statistic
  threshold           = local.alarms.budget.threshold
  alarm_description   = local.alarms.budget.alarm_description
  alarm_actions       = [module.sns_topic.arn]
  dimensions          = local.alarms.budget.dimensions
}
