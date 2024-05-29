output "subnets" {
  value =  aws_subnet.subnets
}

output "vpc_id" {
    value = aws_vpc.matan-terraform-vpc.id
}

output "instance_sg" {
  value = aws_security_group.instance_sg
}