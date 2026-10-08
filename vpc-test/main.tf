module "main" {
  source = "../vpc-module"
  # source = "git::https://github.com/kanchireddynarayanareddy1-bot/Terraform2.0.git//vpc-module?ref=main"
  # Main VPC configuration
  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment
  tags         = var.tags
  # subnets cidrs
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
  databases_subnet_cidr = var.databases_subnet_cidr
}
 