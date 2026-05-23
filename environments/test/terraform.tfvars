aws_region = "us-west-2"

environment = "test"

project_name = "ec2-automation"

# vpc_id = "vpc-0ea2f785bc5c0723a"

# subnet_id = "subnet-0688c963ffeae0377"

#availability_zone = "us-west-2a"

ami_id = "ami-00563078bca04e287"

instance_type = "t3.micro"

instance_name = "web"

key_name = "test-key"

instance_count = 1

enable_encryption = true

associate_public_ip = false

root_volume_size = 20

volume_type = "gp3"

retention_in_days = 30

sg_name = "test-web-sg"

sg_description = "Test Security Group"

role_name = "test-ec2-role"

profile_name = "test-ec2-profile"

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
  "10.0.7.0/24",
  "10.0.8.0/24",
  "10.0.9.0/24"
]

private_subnet_cidrs = [
  "10.0.17.0/24",
  "10.0.18.0/24",
  "10.0.19.0/24"
]

availability_zones = [
  "us-west-2a",
  "us-west-2b",
  "us-west-2c"
]

bucket_name = "test-ec2-storage-2026"