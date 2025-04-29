output "vpc_id" {
  description = "ID of the created or used VPC"
  value       = local.vpc_id
}

output "subnet_ids" {
  description = "List of created subnet IDs"
  value       = aws_subnet.mod_subnets[*].id
}

output "cidr_block" {
  description = "CIDR block of the VPC"
  value       = local.cidr_block
}