resource "aws_cloudwatch_log_group" "this" {

  name = "/ec2/${var.environment}"

  retention_in_days = var.retention_in_days

  tags = var.tags
}