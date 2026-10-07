resource "aws_security_group_rule" "bastion" {
  type              = "ingress"
  security_group_id = local.bastion_sg
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
  
}
resource "aws_security_group_rule" "mongodb-bastion" {
  type              = "ingress"
  security_group_id = local.mongodb_sg  
  source_security_group_id = local.bastion_sg
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
  
}
resource "aws_security_group_rule" "redis-bastion" {
  type              = "ingress"
  security_group_id = local.redis_sg  
  source_security_group_id = local.bastion_sg
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
  
}
resource "aws_security_group_rule" "rabbitmq-bastion" {
  type              = "ingress"
  security_group_id = local.rabbitmq_sg  
  source_security_group_id = local.bastion_sg
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
  
}
resource "aws_security_group_rule" "mysql-bastion" {
  type              = "ingress"
  security_group_id = local.mysql_sg  
  source_security_group_id = local.bastion_sg
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
  
}