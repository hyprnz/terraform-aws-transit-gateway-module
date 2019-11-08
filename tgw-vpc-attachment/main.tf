resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  subnet_ids         = ["${var.vpc_subnet_ids}"]
  transit_gateway_id = "${var.transit_gateway_id}"
  vpc_id             = "${var.vpc_id}"

  transit_gateway_default_route_table_association = "${var.create_default_route_table_association}"
  transit_gateway_default_route_table_propagation = "${var.create_default_route_table_propagation}"

  dns_support  = "${var.dns_support}"
  ipv6_support = "${var.ipv6_support}"

  tags = "${merge(map("Name", var.name), var.tags)}"
}
