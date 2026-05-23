terraform {

  backend "s3" {

    bucket = "nikhil-devops-terraform-state-2026"

    key = "test/terraform.tfstate"

    region = "us-west-2"

    dynamodb_table = "terraform-lock"

    encrypt = true
  }
}