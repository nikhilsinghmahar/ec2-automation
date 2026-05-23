variable "environment" {
  type = string
}

variable "retention_in_days" {
  default = 30
}

variable "tags" {
  type = map(string)
}