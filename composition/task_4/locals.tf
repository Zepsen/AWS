locals {
  alias     = var.alias
  region    = var.region
  fst_email = var.fst_email
  snd_email = var.snd_email

  vpc_cidr = "93.74.138.244/32"

  internal = {
    ingress = [
      {
        description = "Internal Api Port"
        cidr_blocks = [local.vpc_cidr]
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
      },
      {
        description = "Internal SSH Port"
        cidr_blocks = [local.vpc_cidr]
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
      },
      {
        description = "Internal Api Port HTTPS"
        cidr_blocks = [local.vpc_cidr]
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
      }
    ]
    egress = [
      {
        description      = "All"
        cidr_blocks      = ["0.0.0.0/0"]
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        ipv6_cidr_blocks = ["::/0"]
      }
    ]
  }
}
