resource "aws_vpn_connection" "tgw" {
  customer_gateway_id = var.customer_gateway_id
  transit_gateway_id  = var.transit_gateway_id
  type                = data.aws_customer_gateway.this.type

  static_routes_only = var.enable_static_routes_only

  tags = merge(
    {
      "Name" = format("%s-vpn-connection", var.name)
    },
    var.tags,
  )
}

resource "aws_ec2_transit_gateway_route_table" "this" {
  transit_gateway_id = var.transit_gateway_id

  tags = merge(
    {
      "Name" = format("%s-vpn-route-table", var.name)
    },
    var.tags,
  )
}

resource "aws_ec2_transit_gateway_route_table_association" "this" {
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpn_attachment.this.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}

resource "aws_ec2_transit_gateway_route" "this" {
  count = length(var.cidr_subnets_for_static_routes)

  destination_cidr_block         = element(var.cidr_subnets_for_static_routes, count.index)
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpn_attachment.this.id
}

