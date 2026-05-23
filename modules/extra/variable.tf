variable "availability_zone" {
  type = string
}

variable "volume_size" {
  type = number
}

variable "volume_type" {
  type = string
}

variable "encrypted" {
  type = bool
}

variable "kms_key_id" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "device_name" {
  type = string
}

variable "tags" {
  type = map(string)
}