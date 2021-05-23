module "example" {
  source = "../"

  providers = {
    aws = aws
  }

  name = "example-vpn-attachment"

  transit_gateway_id  = "tgw-09bc6fe34e2600cbd"
  customer_gateway_id = module.example_cgw.id

  enable_static_routes_only = true

  cidr_subnets_for_static_routes = ["172.20.0.0/16"]

}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment      = "example-stage",
      "Resource Owner" = "Example Tranist Gateway VPN Attachment"
    }
  }
}

variable "aws_region" {
  default = "ap-southeast-2"
}

