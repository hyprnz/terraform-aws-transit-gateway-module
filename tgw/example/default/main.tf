module "example" {
  source = "../../"

  providers = {
    aws = aws
  }

  name        = "example-tgw"
  description = "An Example TGW via Terraform"
  tags = {
    "Environment" = format("%s", "prod")
  }

  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
}

variable "aws_region" {
  default = "ap-southeast-2"
}

variable "aws_account_number" {
}

output "tgw-arn" {
  value = module.example.arn
}

output "tgw-id" {
  value = module.example.id
}

