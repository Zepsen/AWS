module "bugets" {
  source            = "../../modules/budget/"
  name              = local.budget.name
  budget_type       = local.budget.budget_type
  limit_amount      = local.budget.limit_amount
  limit_unit        = local.budget.limit_unit
  time_period_end   = local.budget.time_period_end
  time_period_start = local.budget.time_period_start
  time_unit         = local.budget.time_unit
  notifications     = local.budget.notifications
}
