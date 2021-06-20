variable "acl" {
  type    = string
  default = "private"
}

variable "bucket" {
  type = string
}

variable "versioning_enabled" {
  type    = bool
  default = false
}

variable "role_arn" {
  type = string
}

variable "destination_bucket" {
  type = string
}
