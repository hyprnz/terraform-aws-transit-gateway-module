output "tgw_vpn_attachment_id" {
  description = "The attachment id"
  value       = "${data.aws_ec2_transit_gateway_vpn_attachment.this.id}"
}

output "vpn_id" {
  description = "The VPN connection id"
  value       = "${aws_vpn_connection.tgw.id}"
}

output "tgw_vpn_attachment_route_table_id" {
  description = "The route table id"
  value       = "${aws_ec2_transit_gateway_route_table.this.id}"
}

output "tgw_vpn_attachment_route_table_association_id" {
  description = "The attachment to route table association id"
  value       = "${aws_ec2_transit_gateway_route_table_association.this.id}"
}
