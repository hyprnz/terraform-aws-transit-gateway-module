module "example" {
  source = "../"

  providers = {
    aws = aws
  }

  name       = "example-cgw"
  ip_address = "1.2.3.4"
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment      = "example-stage",
      "Resource Owner" = "Example Customer Gateway"
    }
  }
}

variable "aws_region" {
  default = "ap-southeast-2"
}

output "cgw_id" {
  value = module.example.id
}

