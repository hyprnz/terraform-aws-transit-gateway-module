output "transit_gateway_attachment_id" {
  description = "The id of the ransit Gateway VPC Attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.this.id
}

