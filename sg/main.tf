resource "aws_security_group" "main" {
  name        = var.sg_name
  vpc_id      = var.vpc_id
  
  tags = merge(
    var.tags, 
    local.common_tags,
    {
        Name="${local.common_name}-${var.sg_name}" #roboshop-dev-catalouge
    }
    )

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
} 