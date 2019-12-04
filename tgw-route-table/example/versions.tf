
terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = "~>2.19"
  }
}

provider "aws" {
  region = var.aws_region
}

