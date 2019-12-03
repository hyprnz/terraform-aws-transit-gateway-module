module "example" {
  source = "../"

  providers = {
    aws = aws
  }

  name = "tgw-stage-vpc-route-table"

  transit_gateway_id            = "tgw-09bc6fe34e2600cbd"
  transit_gateway_attachment_id = "tgw-attach-03db073d6ae1b6082"

  transit_gateway_propagate_attachment_ids = ["tgw-attach-741258963fdb"]

  transit_gateway_static_routes = [
    {
      cidr_block    = "1.2.3.4/32"
      attachment_id = "tgw-attach-0987654321def"
    },
    {
      cidr_block    = "172.31.0.0/16"
      attachment_id = "tgw-attach-0987654321def"
    },
  ]

  tags = {
    "Environment" = "stage"
  }
}

variable "aws_region" {
  default = "ap-southeast-2"
}

