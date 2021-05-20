variable "name" {
  description = "Name of Transit Gateway Attachment resource"
}

variable "vpc_subnet_ids" {
  description = "A list of subnets for routing via the Transit Gateway Attachment. Can only be 1 subnet per AZ"
  type        = list(string)
}

variable "transit_gateway_id" {
  description = "The id of the Transit Gateway the Attachment should bind to"
}

variable "vpc_id" {
  description = "The VPC id for the Attachment"
}

variable "create_default_route_table_association" {
  description = "Whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table. Default value: `true`."
  default     = true
}

variable "create_default_route_table_propagation" {
  description = "Whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table. Default value: true."
  default     = true
}

variable "dns_support" {
  description = "Whether DNS support is enabled. Valid values: `disable`, `enable`. Default value: `enable`."
  default     = "enable"
}

variable "ipv6_support" {
  description = "Whether IPv6 support is enabled. Valid values: `disable`, `enable`. Default value: `disable`."
  default     = "disable"
}

variable "tags" {
  description = "a map of tags to add to Attachment Resource"
  type        = map(string)
  default     = {}
}

