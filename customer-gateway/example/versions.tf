
terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = "~> 2.19"
  }
}

provider "aws" {
  alias  = "noassume"
  region = var.aws_region
}

provider "aws" {
  region = var.aws_region
}

