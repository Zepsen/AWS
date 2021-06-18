locals {
  sns = {
    name         = "${local.alias}-main-sns-topic"
    protocol     = "email"
    fst_endpoint = local.fst_email
    snd_endpoint = local.snd_email
  }
}
