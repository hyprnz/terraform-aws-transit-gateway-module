module "example" {
  source = "../../"

  providers = {
    aws = aws
  }

  name        = "example-tgw"
  description = "An Example TGW via Terraform"

  connecting_aws_account_numbers = var.aws_account_numbers

  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment      = "example-stage",
      "Resource Owner" = "Example Tranist Gateway"
    }
  }
}

variable "aws_region" {
  default = "ap-southeast-2"
}

variable "aws_account_numbers" {
  type    = list(string)
  default = []
}

output "tgw-arn" {
  value = module.example.arn
}

output "tgw-id" {
  value = module.example.id
}

