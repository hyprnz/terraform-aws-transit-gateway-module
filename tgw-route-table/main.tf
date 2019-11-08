resource "aws_ec2_transit_gateway_route_table" "this" {
  transit_gateway_id = "${var.transit_gateway_id}"

  tags = "${merge(map("Name", var.name), var.tags)}"
}

resource "aws_ec2_transit_gateway_route_table_association" "this" {
  transit_gateway_attachment_id  = "${var.transit_gateway_attachment_id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.this.id}"
}

resource "aws_ec2_transit_gateway_route_table_propagation" "this" {
  count = "${length(var.transit_gateway_propagate_attachment_ids)}"

  transit_gateway_attachment_id  = "${element(var.transit_gateway_propagate_attachment_ids, count.index)}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.this.id}"
}

resource "aws_ec2_transit_gateway_route" "this" {
  count = "${length(var.transit_gateway_static_routes)}"

  destination_cidr_block         = "${lookup(var.transit_gateway_static_routes[count.index], "cidr_block")}"
  transit_gateway_attachment_id  = "${lookup(var.transit_gateway_static_routes[count.index], "attachment_id")}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.this.id}"
}