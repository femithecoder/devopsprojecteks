resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_main 
  instance_tenancy = "default"
  enable_dns_hostnames = true
  

  tags = {
    Name = "${var.project_name}-main_vpc"
  }
}

#data source to get all availability zones in region
data "aws_availability_zones" "availability_zones" {}

resource "aws_subnet" "main-public_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.vpc_cidr_public_subnet_main
  availability_zone = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "my-vpc_public_subnet-main"
  }

}
resource "aws_subnet" "main-private_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.vpc_cidr_private_subnet_main
  availability_zone = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = false
  
  tags = {
    Name = "my-vpc_private_subnet-main"
  }
}
resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw-main"
  }
}
#create your public route-table
resource "aws_route_table" "main-public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }
  tags = {
    Name = "public-route-table-eks"
  }
}

resource "aws_route_table_association" "aws-rt" {
  subnet_id = aws_subnet.main-public_subnet.id
  route_table_id = aws_route_table.main-public_route_table.id
}

resource "aws_eip" "main-my_eip" {
  domain = "vpc"

  tags = {
    Name = "my-vpc_eip-main"
  }
}
#create your nat gateway
resource "aws_nat_gateway" "main-ng" {
  allocation_id = aws_eip.main-my_eip.id
  subnet_id = aws_subnet.main-public_subnet.id
}
resource "aws_route_table" "main-private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main-ng.id
  }
  tags = {
    Name = "private-route-table-main"
  }
}
resource "aws_route_table_association" "aws-rt2" {
  subnet_id = aws_subnet.main-private_subnet.id
  route_table_id = aws_route_table.main-private_route_table.id
}
