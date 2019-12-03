module "example" {
  source = "../"

  providers = {
    aws = aws
  }

  name = "example-vpn-attachment"

  transit_gateway_id  = "tgw-09bc6fe34e2600cbd"
  customer_gateway_id = "cgw-0ad0471c2ae86011e"

  enable_static_routes_only = true

  cdir_subnets_for_static_routes = ["172.20.0.0/16"]

  tags = {
    "Type" = "example"
  }
}

variable "aws_region" {
  default = "ap-southeast-2"
}

