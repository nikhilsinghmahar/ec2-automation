# module "vpc" {

#   source               = "../../modules/vpc"
#   environment          = var.environment
#   vpc_cidr             = var.vpc_cidr
#   public_subnet_cidrs  = var.public_subnet_cidrs
#   private_subnet_cidrs = var.private_subnet_cidrs
#   availability_zones   = var.availability_zones
#   tags                 = local.common_tags
# }

module "vpc" {

  source               = "terraform-aws-modules/vpc/aws"
  version              = "5.8.1"
  name                 = "${var.environment}-vpc"
  cidr                 = var.vpc_cidr
  azs                  = var.availability_zones
  public_subnets       = var.public_subnet_cidrs
  private_subnets      = var.private_subnet_cidrs
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = local.common_tags

  public_subnet_tags = {
    Name = "${var.environment}-public-subnet"
  }

  private_subnet_tags = {
    Name = "${var.environment}-private-subnet"
  }
}

# SECURITY GROUP

module "security_group" {

  source      = "../../modules/security-group"
  sg_name     = var.sg_name
  description = var.sg_description
  # NOW TAKING VPC ID FROM VPC MODULE
  vpc_id = module.vpc.vpc_id

  ingress_rules = var.ingress_rules

  tags = local.common_tags
}

# IAM PROFILE

module "iam_profile" {

  source = "../../modules/iam-profile"

  role_name = var.role_name

  profile_name = var.profile_name

  tags = local.common_tags
}

# MONITORING

module "monitoring" {

  source = "../../modules/monitoring"

  environment       = var.environment
  retention_in_days = var.retention_in_days

  tags = local.common_tags
}

# S3 MODULE

module "s3" {

  source = "../../modules/s3"

  bucket_name = var.bucket_name

  tags = local.common_tags
}

#kms module 
module "kms" {

  source = "../../modules/kms"

  description = "KMS Key for EC2 EBS Encryption"

  alias_name = "${var.environment}-ebs-key"

  environment = var.environment

  tags = local.common_tags
}

# EC2 MODULE

module "ec2" {

  source = "../../modules/ec2-instance"

  instance_name = var.instance_name
  environment   = var.environment
  ami_id        = var.ami_id
  instance_type = var.instance_type

  # NOW TAKING SUBNET FROM VPC MODULE
  subnet_id = module.vpc.private_subnets[0]

  cloudwatch_log_group_name = module.monitoring.log_group_name

  security_group_ids = [
    module.security_group.security_group_id
  ]
  #kms_key_id          = module.kms.kms_key_id
  kms_key_id          = module.kms.kms_key_arn
  key_name            = var.key_name
  instance_count      = var.instance_count
  enable_encryption   = var.enable_encryption
  associate_public_ip = var.associate_public_ip

  iam_instance_profile = module.iam_profile.instance_profile_name

  user_data_file   = var.user_data_file
  root_volume_size = var.root_volume_size
  volume_type      = var.volume_type

  common_tags = local.common_tags

  additional_ebs_volumes = var.additional_ebs_volumes
}