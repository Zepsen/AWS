variable "name" {
  type        = string
  description = "Security group for ec2 instance"
  default     = "sg-for-ec2"
}

variable "vpc_id" {
  type    = string
  default = "default"
}

variable "description" {
  type    = string
  default = "Security group for ec2 instance"
}

variable "ingresses" {
  type = list(object({
    from_port   = number,
    to_port     = number,
    protocol    = string,
    cidr_blocks = list(string),
    description = string,
  }))
}

variable "egresses" {
  type = list(object({
    from_port        = number,
    to_port          = number,
    protocol         = string,
    cidr_blocks      = list(string),
    description      = string,
    ipv6_cidr_blocks = list(string)
  }))
}

