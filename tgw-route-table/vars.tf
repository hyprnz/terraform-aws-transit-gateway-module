variable "name" {
  description = "Name tag for the Transit Gateway"
}

variable "transit_gateway_id" {
  description = "The Transit Gateway id"
}

variable "transit_gateway_attachment_id" {
  description = "The Transit Gateway Attachment id to associate with the route table"
}

variable "transit_gateway_propagate_attachment_ids" {
  description = "A list of Transit Gateway Attachment ids to propagate in the route table"
  type        = list(string)
  default     = []
}

variable "transit_gateway_static_routes" {
  description = "A list of key value pairs containing the cidr blcook and the attachment id route combinations"
  type        = list(object({ cidr_block = string, attachment_id = string }))
  default     = []
}

variable "tags" {
  description = "Tags to add to all resources"
  default     = {}
}

