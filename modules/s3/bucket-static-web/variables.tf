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

variable "index_document" {
  type    = string
  default = "index.html"
}

variable "error_document" {
  type    = string
  default = "error.html"
}
