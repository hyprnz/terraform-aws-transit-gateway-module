variable "name" {
  description = "The name of the transit gateway"
}

variable "environment" {
  description = "The environment where the tg-is provisioned"
}

variable "connecting_aws_account_numbers" {
  description = "The AWS account numbers to share the transit gateway with. Should exclude the account number where the tranist gateway is being provisioned"
  default = []
}
