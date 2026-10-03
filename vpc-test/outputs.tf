output "vpc_id" {
  value = module.main.vpc_id
}
output "public_subnets" {
  value = module.main.public_subnets
}
output "private_subnets" {
  value = module.main.private_subnets
}
output "databases_subnets" {
  value = module.main.databases_subnets
}
output "igw" {
  value = module.main.igw
}