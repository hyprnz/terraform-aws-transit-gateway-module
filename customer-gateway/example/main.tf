module "example" {
  source = "../"

  providers = {
    aws = "aws"
  }

  name       = "example-cgw"
  ip_address = "1.2.3.4"
  tags       = "${map("Environment", format("%s", "prod"))}"
}

variable "aws_region" {
  default = "ap-southeast-2"
}

variable "aws_account_number" {}

output "cgw_id" {
  value = "${module.example.id}"
}
