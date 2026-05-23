variable "environment" {

  type = string

  validation {

    condition = contains(
      ["dev", "test", "prod"],
      var.environment
    )

    error_message = "Environment must be dev/test/prod."
  }
}

variable "instance_type" {

  type = string

  validation {

    condition = (
      var.environment != "prod" ||
      contains(
        ["m5.large", "m5.xlarge"],
        var.instance_type
      )
    )

    error_message = "Prod only allows approved instance types."
  }
}