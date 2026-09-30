module "main" {
    source = "../vpc-module"
# Main VPC configuration
    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
    environment = var.environment
    tags = var.tags
# subnets cidrs
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    databases_subnet_cidr = var.databases_subnet_cidr
}
 