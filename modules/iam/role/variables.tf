variable "name" {
  type = string
}

variable "path" {
  type    = string
  default = "/system/"
}

variable "assume_role_policy" {
  type = string
}
