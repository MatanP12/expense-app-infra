output "subnets_id" {
  value = aws_subnet.private_subnets.*.id
}

output "vpc_id" {
  value = aws_vpc.matan-terraform-vpc.id
}
