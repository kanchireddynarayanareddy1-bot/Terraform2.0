locals {
  common_tags ={
    Project=var.project_name
    Environment=var.environment
    Terraform=true
  }
  common_name="${var.project_name}-${var.environment}"
  vpc_id=data.aws_ssm_parameter.vpc_id.value


}