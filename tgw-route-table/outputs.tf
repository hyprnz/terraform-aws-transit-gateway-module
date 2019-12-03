output "transit_gateway_route_table_id" {
  description = "Transit Gateway Route Table identifier"
  value       = aws_ec2_transit_gateway_route_table.this.id
}

