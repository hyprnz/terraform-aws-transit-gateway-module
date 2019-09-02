variable "name" {
  description = "The name of the Customer Gateway"
}

variable "bgp_asn" {
  description = "The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN)"
  default     = 65000
}

variable "ip_address" {
  description = "The IP address of the gateway's Internet-routable external interface"
}

variable "type" {
  description = " The type of customer gateway. The only type AWS supports at this time is `ipsec.1`"
  default     = "ipsec.1"
}

variable "tags" {
  description = "Additional tags for the CGW"
  default     = {}
}
