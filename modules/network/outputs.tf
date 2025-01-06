output "subnets_id" {
  value =  var.allow_private_subnets ? aws_subnet.private_subnets.*.id : aws_subnet.public_subnets.*.id
}

output "vpc_id" {
  value = aws_vpc.matan-terraform-vpc.id
}
