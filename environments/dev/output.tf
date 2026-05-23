output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "ec2_instance_ids" {
  value = module.ec2.instance_ids
}

# output "s3_bucket" {
#   value = module.s3.bucket_id
# }