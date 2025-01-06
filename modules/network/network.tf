# Create a VPC
resource "aws_vpc" "matan-terraform-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { Name = "${var.env}-matan-vpc" }
}

# Create a AWS internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.matan-terraform-vpc.id
  tags   = { Name = "${var.env}-matan-igw" }
}

# create public subnets
resource "aws_subnet" "public_subnets" {
  count                   = var.num_of_subnets
  vpc_id                  = aws_vpc.matan-terraform-vpc.id
  cidr_block              = cidrsubnet(aws_vpc.matan-terraform-vpc.cidr_block, 8, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags                    = { Name = "${var.env}-matan-public-subnet-${count.index}" }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.matan-terraform-vpc.id
  tags   = { Name = "${var.env}-matan-public_rt" }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}


resource "aws_route_table_association" "route_table_as" {
  count          = var.num_of_subnets
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnets[count.index].id
}

resource "aws_eip" "nat_eips" {
  count =  var.allow_private_subnets ? var.num_of_subnets : 0
  domain = "vpc"
  tags = {
    Name = "${var.env}-matan-eip-${count.index}"
  }
  depends_on = [ aws_internet_gateway.igw ]
}

resource "aws_nat_gateway" "nat_gateways" {
  count = var.allow_private_subnets ? var.num_of_subnets : 0
  allocation_id = aws_eip.nat_eips[count.index].id
  subnet_id = aws_subnet.public_subnets[count.index].id
  tags = { Name = "${var.env}-matan-nat-gateway-${count.index}"}
  
}

resource "aws_subnet" "private_subnets" {
  count = var.allow_private_subnets ? var.num_of_subnets : 0
  vpc_id = aws_vpc.matan-terraform-vpc.id
  cidr_block = cidrsubnet(aws_vpc.matan-terraform-vpc.cidr_block, 8, length(aws_subnet.public_subnets)+count.index)
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = false
  tags = { Name = "${var.env}-matan-private-subnet-${count.index}" }
}


resource "aws_route_table" "private_route_tables" {
  count = var.allow_private_subnets ? var.num_of_subnets : 0
  vpc_id = aws_vpc.matan-terraform-vpc.id
  tags   = { Name = "${var.env}-matan-private-rt-${count.index}" }
  route {
    nat_gateway_id = aws_nat_gateway.nat_gateways[count.index].id
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  count = var.allow_private_subnets ? var.num_of_subnets : 0
  subnet_id = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_tables[count.index].id
}