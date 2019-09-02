variable "name" {
  description = "The name of the transit gateway"
}

variable "description" {
  description = "A description of the Transit Gateway"
  default     = ""
}

variable "connecting_aws_account_numbers" {
  description = "The AWS account numbers to share the transit gateway with. Should exclude the account number where the transit gateway is being provisioned"
  default     = []
}

variable "default_route_table_association" {
  description = "Whether resource attachments are automatically associated with the default association route table. Valid values: `disable`, `enable`."
  default     = "enable"
}

variable "default_route_table_propagation" {
  description = " Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`."
  default     = "enable"
}

variable "auto_accept_shared_attachments" {
  description = "Whether resource attachment requests are automatically accepted. Valid values: `disable`, `enable`."
  default     = "disable"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "tgw_tags" {
  description = "Additional tags for the transit gateway"
  default     = {}
}

variable "ram_resource_share_tags" {
  description = "Additional tags for the Resource Share"
  default     = {}
}
