locals {
  requires_ram_share = "${length(var.connecting_aws_account_numbers) > 0 ? 1 : 0}"
}

resource "aws_ec2_transit_gateway" "this" {
  auto_accept_shared_attachments = "enable"

  tags = {
    Name        = "${var.name}",
    Environment = "${var.environment}"
  }
}

resource "aws_ram_resource_share" "this" {
  count = "${local.requires_ram_share}"
  name = "terraform-tgw-share"

  tags = {
    Name        = "${var.name}",
    Environment = "${var.environment}"
  }
}

// Share the transit gateway...
resource "aws_ram_resource_association" "this" {
  count = "${local.requires_ram_share}"
  resource_arn       = "${aws_ec2_transit_gateway.this.arn}"
  resource_share_arn = "${aws_ram_resource_share.this.id}"
}

// ...with the second account.
resource "aws_ram_principal_association" "this" {
  count = "${local.requires_ram_share}"
  principal          = "${var.connecting_aws_account_numbers}"
  resource_share_arn = "${aws_ram_resource_share.this.id}"
}


# // Create the VPC attachment in the second account...
# resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
#   provider = "vpc/vpn-target-account"

#   depends_on = ["aws_ram_principal_association.this", "aws_ram_resource_association.this"]

#   subnet_ids         = "${var.target_vpc_subnet_ids}"
#   transit_gateway_id = "${aws_ec2_transit_gateway.this.id}"
#   vpc_id             = "${var.target_vpc_id}"

#   tags = {
#     Name = "${var.name}"
#     Side = "Creator"
#   }
# }

# // ...and accept it in the first account.
# resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "example" {
#   provider = "aws.tg-target-account"

#   transit_gateway_attachment_id = "${aws_ec2_transit_gateway_vpc_attachment.this.id}"

#   tags = {
#     Name = "${var.name}"
#     Side = "Accepter"
#   }
# }