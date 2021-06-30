module "sg-groups" {
  source = "../../modules/ec2/sg"

  ingresses   = local.internal.ingress
  egresses    = local.internal.egress
  name        = "Private security group"
  description = "Private secuirty group"
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "FullAccessS3Role"
}

module "ec2" {
  source = "../../modules/ec2/instance"

  role            = profile.test_profile.name
  ami             = data.aws_ami.ubuntu.id
  security_groups = [module.sg-groups.name]
  with_ebs        = true
  ssh_key         = "ec2_ssh_key"
}

module "ec2_without_ebs" {
  source = "../../modules/ec2/instance"

  name            = "EC2_without_EBS"
  role            = aws_iam_instance_profile.test_profile.name
  ami             = data.aws_ami.ubuntu.id
  security_groups = [module.sg-groups.name]
  ssh_key         = "ec2_ssh_key2"
}

module "ec2_with_lb" {
  source = "../../modules/ec2/alb"

  ami             = data.aws_ami.ubuntu.id
  security_groups = [module.sg-groups.id]
  ssh_key         = "ec2_ssh_key"
}