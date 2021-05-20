module "example" {
  source = "../../"

  name        = "example-tgw"
  description = "An Example TGW via Terraform"

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

output "tgw-arn" {
  value = module.example.arn
}

output "tgw-id" {
  value = module.example.id
}

