output "tgw_vpn_attachment_id" {
  value = "${data.aws_ec2_transit_gateway_vpn_attachment.this.id}"
}

output "vpn_id" {
  value = "${aws_vpn_connection.tgw.id}"
}

output "tgw-vpn_attachment_route_table_id" {
  value = "${aws_ec2_transit_gateway_route.this.id}"
}

output "tgw_vpn_attachment_route_table_association_id" {
  value = "${aws_ec2_transit_gateway_route_table_association.this.id}"
}
