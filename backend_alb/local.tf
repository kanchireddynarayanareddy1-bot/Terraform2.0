locals {
  common_name="${var.project_name}-${var.environment}"
  common_tags={
    Project=var.project_name
    Environment=var.environment
    Terraform=true
  }
  sg_id=data.aws_ssm_parameter.sg_name.value
  private_subnets=split(",", data.aws_ssm_parameter.private_subnets.value)
}