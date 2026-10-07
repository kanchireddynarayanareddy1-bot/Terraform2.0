module "main" {
  source = "../sg"
  count = length(var.sg_name)
    project_name = var.project_name
    environment = var.environment
    vpc_id = local.vpc_id
    sg_name = var.sg_name[count.index]
    tags = local.common_tags

}
 resource "aws_security_group_rule" "frontend_frontend_alb" {
  type              = "ingress"
  security_group_id = module.main[9].sg_name  # frontend sg id
  source_security_group_id = module.main[11].sg_name # source sg id[source is frontend alb]
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}
 resource "aws_security_group_rule" "frontend_alb_public" {
  type              = "ingress"
  security_group_id = module.main[11].sg_name  # frontend sg id
  cidr_blocks       = ["0.0.0.0/0"]  # source sg id[source is frontend alb]
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}
