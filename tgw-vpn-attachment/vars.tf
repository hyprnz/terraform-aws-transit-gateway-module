variable "name" {
  description = "Name of the tgw-attachment resource"
}

variable "customer_gateway_id" {
  description = "The customer gateway id for the VPN Connection"
}

variable "transit_gateway_id" {
  description = "The transit gateway id"
}

variable "tags" {
  description = "Additional tags for all vpn-attachment resources"
  default     = {}
}

variable "cdir_subnets_for_static_routes" {
  description = "A list of cdirs subnets to be routed over the vpn connection"
  type        = list(string)
}

variable "enable_static_routes_only" {
  description = "If the VPN connection should use static routing only"
  default     = false
}

