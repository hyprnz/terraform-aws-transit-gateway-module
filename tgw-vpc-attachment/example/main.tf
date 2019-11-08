module "example" {
  source = "../"

  providers = {
    aws = "aws"
  }

  vpc_subnet_ids     = ["subnet-0123456789abc", "subnet-321654987cba", "subnet-741258963bac"]
  transit_gateway_id = "tgw-123456789"
  vpc_id             = "vpc-123456789"

  create_default_route_table_association = false
  create_default_route_table_propagation = false

  tags = "${merge(map("Name", "tgw-vpc-example-stage"), map("Environment", "stage"))}"
}

variable "aws_region" {
  default = "ap-southeast-2"
}

