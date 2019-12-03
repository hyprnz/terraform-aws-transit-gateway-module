module "example" {
  source = "../../"

  providers = {
    aws = "aws"
  }

  name        = "example-tgw"
  description = "An Example TGW via Terraform"
  tags        = "${map("Environment", format("%s", "stage"))}"

  connecting_aws_account_numbers = ["${var.aws_account_number}"]

  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
}

variable "aws_region" {
  default = "ap-southeast-2"
}

variable "aws_account_number" {
  default = ""
}

output "tgw-arn" {
  value = "${module.example.arn}"
}

output "tgw-id" {
  value = "${module.example.id}"
}
