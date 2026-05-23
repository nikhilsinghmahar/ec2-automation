aws_region   = "us-west-2"
environment  = "dev"
project_name = "ec2-automation"

# vpc_id = "vpc-0ea2f785bc5c0723a"

# subnet_id = "subnet-0688c963ffeae0377"

#availability_zone = "us-west-2a"

ami_id = "ami-00563078bca04e287"

instance_type = "t3.micro"

instance_name = "web"

key_name = "dev-key"

instance_count = 1

enable_encryption = true

associate_public_ip = false

root_volume_size = 20

volume_type = "gp3"

retention_in_days = 30

sg_name = "dev-web-sg"

sg_description = "Dev Security Group"

role_name = "dev-ec2-role"

profile_name = "dev-ec2-profile"

user_data_file = "../../scripts/userdata.sh"

ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

additional_ebs_volumes = [
  {
    device_name = "/dev/sdf"
    volume_size = 50
    volume_type = "gp3"
  }
]
vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24",
  "10.0.13.0/24"
]

availability_zones = [
  "us-west-2a",
  "us-west-2b",
  "us-west-2c"
]

# bucket_name = "dev-ec2-storage-2026"