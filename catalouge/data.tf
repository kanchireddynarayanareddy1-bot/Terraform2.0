data "aws_ssm_parameter" "catalogue_sg" {
  name = "/${var.project_name}/${var.environment}/catalogue/sg_name"
}
data "aws_ssm_parameter" "private_subnets" {
 name  = "/${var.project_name}/${var.environment}/private_subnets"
}
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