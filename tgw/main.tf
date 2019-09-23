locals {
  requires_ram_share = "${length(var.connecting_aws_account_numbers) > 0 ? 1 : 0}"
}

resource "aws_ec2_transit_gateway" "this" {
  description                     = "${var.description}"
  auto_accept_shared_attachments  = "${var.auto_accept_shared_attachments}"
  default_route_table_association = "${var.default_route_table_association}"
  default_route_table_propagation = "${var.default_route_table_propagation}"

  tags = "${merge(map("Name", format("%s", var.name)), var.tgw_tags, var.tags )}"
}

resource "aws_ram_resource_share" "this" {
  count = "${local.requires_ram_share}"
  name  = "terraform-${var.name}-share"

  tags = "${merge(map("TGW-Name", format("%s", var.name)), map("Resource", "Transit-Gateway"), var.ram_resource_share_tags, var.tags )}"
}

resource "aws_ram_resource_association" "this" {
  count              = "${local.requires_ram_share}"
  resource_arn       = "${aws_ec2_transit_gateway.this.arn}"
  resource_share_arn = "${aws_ram_resource_share.this.id}"
}

resource "aws_ram_principal_association" "this" {
  count              = "${local.requires_ram_share}"
  principal          = "${element(var.connecting_aws_account_numbers, count.index)}"
  resource_share_arn = "${aws_ram_resource_share.this.id}"
}
