resource "aws_customer_gateway" "this" {
  bgp_asn    = var.bgp_asn
  ip_address = var.ip_address
  type       = var.type

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )
}
