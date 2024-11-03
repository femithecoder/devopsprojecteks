resource "aws_vpc" "eks" {
  cidr_block = var.vpc_cidr 
  instance_tenancy = "default"
  enable_dns_hostnames = true
  
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Name = "${var.project_name}-eks_vpc"
  }
}

#data source to get all availability zones in region
data "aws_availability_zones" "availability_zones" {}

resource "aws_subnet" "eks-public_subnet" {
  vpc_id = aws_vpc.eks.id
  cidr_block = var.vpc_cidr_public_subnet
  availability_zone = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = true

  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Name = "my-vpc_public_subnet-eks"
  }

}
resource "aws_subnet" "eks-private_subnet" {
  vpc_id = aws_vpc.eks.id
  cidr_block = var.vpc_cidr_private_subnet
  availability_zone = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = false
  
  lifecycle {
    prevent_destroy = true
  }
  
  tags = {
    Name = "my-vpc_private_subnet-eks"
  }
}
resource "aws_internet_gateway" "eks-igw" {
  vpc_id = aws_vpc.eks.id

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "${var.project_name}-igw-eks"
  }
}
#create your public route-table
resource "aws_route_table" "eks-public_route_table" {
  vpc_id = aws_vpc.eks.id

  lifecycle {
    prevent_destroy = true
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }
  tags = {
    Name = "public-route-table-eks"
  }
}

resource "aws_route_table_association" "aws-rt" {
  subnet_id = aws_subnet.eks-public_subnet.id
  route_table_id = aws_route_table.eks-public_route_table.id
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_eip" "eks-my_eip" {
  domain = "vpc"

  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Name = "my-vpc_eip-eks"
  }
}
#create your nat gateway
resource "aws_nat_gateway" "eks-main-ng" {
  allocation_id = aws_eip.eks-my_eip.id
  subnet_id = aws_subnet.eks-public_subnet.id

  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_route_table" "eks-private_route_table" {
  vpc_id = aws_vpc.eks.id

  lifecycle {
    prevent_destroy = true
  }

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-main-ng.id
  }
  tags = {
    Name = "private-route-table-eks"
  }
}
resource "aws_route_table_association" "aws-rt2" {
  subnet_id = aws_subnet.eks-private_subnet.id
  route_table_id = aws_route_table.eks-private_route_table.id

  lifecycle {
    prevent_destroy = true
  }
}

