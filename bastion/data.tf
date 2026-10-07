data "aws_ami" "joindevops" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_ssm_parameter" "bastion_sg_name" {
  name = "/${var.project_name}/${var.environment}/bastion/sg_name"
}
data "aws_ssm_parameter" "public_subnets" {
  name  = "/${var.project_name}/${var.environment}/public_subnets"
}
data "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
}