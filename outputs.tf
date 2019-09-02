output "arn" {
  description = "The ARN of the transit Gateway"
  value       = "${aws_ec2_transit_gateway.this.arn}"
}

output "id" {
  description = "The ID of the Transit Gateway"
  value       = "${aws_ec2_transit_gateway.this.id}"
}

output "default_route_table_id" {
  description = "The default route table associated with the Transit Gateway"
  value       = "${aws_ec2_transit_gateway.this.association_default_route_table_id}"
}

output "ram_resource_share_id" {
  description = "The id of the RAM resource share"
  value       = "${aws_ram_resource_share.this.*.id}"
}
