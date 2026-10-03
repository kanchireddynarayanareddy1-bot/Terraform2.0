output "vpc_id" {
  value = aws_vpc.main.id
}
output "igw" {
  value = aws_internet_gateway.main.id
}
output "public_subnets" {
  value = aws_subnet.public_subnets[*].id
}
output "private_subnets" {
  value=aws_subnet.private_subnets[*].id
}
output "databases_subnets" {
  value = aws_subnet.databases_subnets[*].id
}