variable "role" {
  type = string
}

variable "name" {
  type    = string
  default = "MyEC2"
}

variable "ami" {
  type        = string
  description = "AMI for ec2"
}

variable "security_groups" {
  type        = list(string)
  description = "Securtiy group names for default vpc"
}

variable "with_ebs" {
  type    = bool
  default = false
}

variable "ssh_key" {
  type = string
}
