variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

# variable "vpc_id" {
#   description = "VPC ID"
#   type        = string
# }

# variable "subnet_id" {
#   description = "Subnet ID"
#   type        = string
# }

# variable "availability_zone" {
#   description = "Availability Zone"
#   type        = string
# }

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "instance_name" {
  description = "EC2 Instance Name"
  type        = string
}

variable "key_name" {
  description = "SSH Key Pair Name"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 Instances"
  type        = number
}

variable "enable_encryption" {
  description = "Enable EBS Encryption"
  type        = bool
}

variable "associate_public_ip" {
  description = "Associate Public IP"
  type        = bool
}

variable "root_volume_size" {
  description = "Root Volume Size"
  type        = number
}

variable "volume_type" {
  description = "EBS Volume Type"
  type        = string
}

variable "user_data_file" {
  description = "Path to User Data Script"
  type        = string
}

variable "retention_in_days" {
  description = "CloudWatch Log Retention"
  type        = number
}

variable "sg_name" {
  description = "Security Group Name"
  type        = string
}

variable "sg_description" {
  description = "Security Group Description"
  type        = string
}

variable "role_name" {
  description = "IAM Role Name"
  type        = string
}

variable "profile_name" {
  description = "IAM Instance Profile Name"
  type        = string
}

variable "ingress_rules" {

  description = "Ingress Rules"

  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "additional_ebs_volumes" {

  description = "Additional EBS Volumes"

  type = list(object({
    device_name = string
    volume_size = number
    volume_type = string
  }))
}
variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {

  description = "Private subnet CIDRs"

  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

# variable "bucket_name" {
#   type = string
# }