resource "aws_ssm_parameter" "sg_name" {
  count = length(var.sg_name)
  name = "/${var.project_name}/${var.environment}/${var.sg_name[count.index]}/sg_name"
  type = "String"
  value = module.main[count.index].sg_name
}