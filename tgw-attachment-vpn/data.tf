data "aws_customer_gateway" "this" {
  id = "${var.customer_gateway_id}"
}

data "aws_ec2_transit_gateway_vpn_attachment" "this" {
  vpn_connection_id  = "${aws_vpn_connection.tgw.id}"
  transit_gateway_id = "${var.transit_gateway_id}"
}
