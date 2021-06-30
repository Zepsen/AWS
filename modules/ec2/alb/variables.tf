variable "ami" {
  type        = string
  description = "AMI for ec2"
}

variable "security_groups" {
  type        = list(string)
  description = "Securtiy group names for default vpc"
}

variable "ssh_key" {
  type = string
}
