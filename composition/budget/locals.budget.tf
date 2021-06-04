locals {
  budget = {
    name              = "${local.alias}-monthly-budget"
    budget_type       = "COST"
    limit_amount      = "10"
    limit_unit        = "USD"
    time_period_end   = "2027-06-15_00:00"
    time_period_start = "2017-07-01_00:00"
    time_unit         = "MONTHLY"
  }
}
