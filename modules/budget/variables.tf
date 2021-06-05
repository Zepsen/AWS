variable "name" {
  type = string
}

variable "budget_type" {
  type = string
}

variable "limit_amount" {
  type = string
}

variable "limit_unit" {
  type = string
}

variable "time_period_end" {
  type = string
}

variable "time_period_start" {
  type = string
}

variable "time_unit" {
  type = string
}

variable "notifications" {
  type = list(object({
    threshold : number,
    comparison_operator : string,
    threshold_type : string,
    notification_type : string,
    subscriber_sns_topic_arns : list(string)
  }))
}
