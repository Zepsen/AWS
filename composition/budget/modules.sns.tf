module "sns_topic" {
  source = "../../modules/sns/topic"
  name   = local.sns.name
}

module "sns_fst_subscription" {
  source    = "../../modules/sns/subscription"
  topic_arn = module.sns_topic.arn
  protocol  = local.sns.protocol
  endpoint  = local.sns.fst_endpoint
}

module "sns_snd_subscription" {
  source    = "../../modules/sns/subscription"
  topic_arn = module.sns_topic.arn
  protocol  = local.sns.protocol
  endpoint  = local.sns.snd_endpoint
}
