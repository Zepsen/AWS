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
