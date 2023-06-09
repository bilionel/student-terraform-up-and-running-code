provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-state-lionel"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-lionel"
    region = "us-east-1"
    key = "stage/services/webserver-cluster/terraform.tfstate"
    encrypt = true
  }
}
