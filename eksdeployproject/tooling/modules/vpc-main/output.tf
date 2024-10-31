output "main-region" {
  value = var.main-region
}
output "project_name" {
  value = var.project_name
}
output "vpc_id_main" {
  value = aws_vpc.main.id
}
output "public_subnet_main" {
  value = aws_subnet.main-public_subnet.id
}
output "private_subnet_main" {
  value = aws_subnet.main-private_subnet.id
}
output "internet_gateway_main" {
  value = aws_internet_gateway.main-igw
}