module "example" {
  source = "../"

  providers = {
    aws = aws
  }
  name               = "tgw-vpc-example-stage"
  vpc_subnet_ids     = [aws_subnet.sub1.id, aws_subnet.sub2.id, aws_subnet.sub3.id]
  transit_gateway_id = "tgw-09bc6fe34e2600cbd"
  vpc_id             = aws_vpc.example_vpc.id

  create_default_route_table_association = false
  create_default_route_table_propagation = false
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment      = "example-stage",
      "Resource Owner" = "Example Tranist Gateway VPC Attachment"
    }
  }
}

variable "aws_region" {
  default = "ap-southeast-2"
}

resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub1" {
  cidr_block        = "10.0.0.0/24"
  vpc_id            = aws_vpc.example_vpc.id
  availability_zone = "ap-southeast-2a"
}

resource "aws_subnet" "sub2" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.example_vpc.id
  availability_zone = "ap-southeast-2b"
}

resource "aws_subnet" "sub3" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.example_vpc.id
  availability_zone = "ap-southeast-2c"
}

output "aws_ec2_transit_gateway_vpc_attachment" {
  value = module.example.transit_gateway_attachment_id
}

