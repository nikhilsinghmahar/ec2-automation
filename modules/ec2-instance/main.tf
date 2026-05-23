resource "aws_instance" "this" {

  count = var.instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name

  vpc_security_group_ids = var.security_group_ids

  iam_instance_profile   = var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip

  monitoring = var.enable_monitoring

  user_data = templatefile(var.user_data_file, {

  environment = var.environment

  cloudwatch_config = templatefile(
    "${path.module}/../../scripts/cloudwatch-config.json.tpl",
    {
      environment = var.environment
    }
  )
})

  root_block_device {

    volume_size = var.root_volume_size
    volume_type = var.volume_type

    encrypted = var.enable_encryption
    kms_key_id = var.kms_key_id

    delete_on_termination = true
  }

  dynamic "ebs_block_device" {

  for_each = var.additional_ebs_volumes

  content {

    device_name = ebs_block_device.value.device_name
    volume_size = ebs_block_device.value.volume_size
    volume_type = ebs_block_device.value.volume_type

    encrypted = true

    kms_key_id = var.kms_key_id
  }
}

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.environment}-${var.instance_name}"
      Environment = var.environment
    }
  )
}