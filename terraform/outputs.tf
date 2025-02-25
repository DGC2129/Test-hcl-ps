output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.default.id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.default.arn
}