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

module "sns_policy" {
  source = "../../modules/iam/sns_policy"
  arn    = module.sns_topic.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}
