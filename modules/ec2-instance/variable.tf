variable "instance_name" {}
# variable "environment" {}
variable "ami_id" {}
# variable "instance_type" {}

variable "subnet_id" {}

variable "security_group_ids" {
  type = list(string)
}

variable "key_name" {}

variable "instance_count" {
  default = 1
}

variable "associate_public_ip" {
  default = false
}

variable "iam_instance_profile" {}

variable "enable_monitoring" {
  default = true
}

variable "user_data_file" {}

variable "root_volume_size" {
  default = 30
}

variable "volume_type" {
  default = "gp3"
}

variable "enable_encryption" {
  default = true
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "additional_ebs_volumes" {
  type = list(object({
    device_name = string
    volume_size = number
    volume_type = string
  }))

  default = []
}

variable "common_tags" {
  type = map(string)
}

variable "cloudwatch_log_group_name" {
  default = null
}

