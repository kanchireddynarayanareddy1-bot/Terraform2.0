locals {
  common_name= "${var.project_name}-${var.environment}"
  common_tags={
    Project=var.project_name
    Environment=var.environment
    Terraform= true
  }
  az_names = slice(data.aws_availability_zones.available.names, 0, 2)

}