output "main-region" {
  value = var.main-region
}
output "project_name" {
  value = var.project_name
}
output "vpc_id" {
  value = aws_vpc.eks.id
}
output "public_subnet" {
  value = aws_subnet.eks-public_subnet.id
}
output "private_subnet" {
  value = aws_subnet.eks-private_subnet_01.id
}
output "private_subnet_01" {
  value = aws_subnet.eks-private_subnet_02.id
}
output "internet_gateway" {
  value = aws_internet_gateway.eks-igw
}