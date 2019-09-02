module "example" {
  source = "../"

  providers = {
    aws = "aws"
  }

  name = "example-vpn-attachment"

  transit_gateway_id  = "tgw-0987654321"
  customer_gateway_id = "cgw-1234567890"

  enable_static_routes_only = true

  cdir_subnets_for_static_routes = ["172.20.0.0/16"]

  tags = "${map( "Type", "example")}"
}

variable "aws_region" {
  default = "ap-southeast-2"
}

variable "aws_account_number" {}
