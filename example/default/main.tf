module "example" {
  source = "../../"

  providers = {
    aws = "aws"
  }

  name                  = "example-tgw"
  environment           = "test"

}

variable "aws_region" {
  default = "ap-southeast-2"
}
