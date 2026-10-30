resource "aws_instance" "catalogue" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.catalogue_sg]
  subnet_id = local.private_subnet
  
  tags = merge(
    local.common_tags,
    {
      Name="${local.common_name}-catalogue"
    }
  )
}
resource "terraform_data" "catalogue" {
   triggers_replace = [
    aws_instance.catalogue.id
   ]
   provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
   }
    provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh catalogue"
     ]
    }
    connection {
    type = "ssh"
    user =  "ec2-user"
    password = "DevOps321"
    host = aws_instance.catalogue.private_ip
    }
}
resource "aws_ec2_instance_state" "catalogue" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
  depends_on = [terraform_data.catalogue]
}
resource "aws_ami_from_instance" "catalogue" {
  name               = "${var.project_name}-${var.environment}-catalogue"
  source_instance_id = aws_instance.catalogue.id
  depends_on = [aws_ec2_instance_state.catalogue]
}

resource "aws_lb_target_group" "catalogue" {
  name     = "${local.common_name}-catalogue"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = local.vpc_id
  deregistration_delay = 60 # waiting period before deleting the instance from the target group
  health_check {
    path                = "/health"
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-399"
    port                = 8080
  }
}
resource "aws_launch_template" "catalogue" {
  name_prefix   = "${local.common_name}-catalogue"
  image_id      = aws_ami_from_instance.catalogue_ami.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.catalogue_sg]
  tags = merge(
    local.common_tags,
    {
      Name="${local.common_name}-catalogue"
    }
  )
  # tags for the launch template
  tag_specifications {
    resource_type = "instance"
    tags = merge(
      local.common_tags,
      {
        Name="${local.common_name}-catalogue"
      }
    )
  }
  # tags for the root volume
  tag_specifications {
    resource_type = "volume"
    tags = merge(
      local.common_tags,
      {
        Name="${local.common_name}-catalogue"
      }
    )
  }
}

resource "aws_autoscaling_group" "catalogue" {
  name                      = "${local.common_name}-catalogue"
  max_size                  = 10
  min_size                  = 1
  health_check_grace_period = 100
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = false
  launch_template {
    id      = aws_launch_template.catalogue.id
    version = aws_launch_template.catalogue.latest_version
  }
  vpc_zone_identifier       = [local.private_subnets]
  target_group_arns         = [aws_lb_target_group.catalogue.arn]

  dynamic "tag" {
    for_each = merge(local.common_tags,
    {
      Name="${local.common_name}-catalogue"
    }
    )
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
  timeouts {
    delete = "15m"
  }
}
resource "aws_autoscaling_policy" "catalogue" {
  autoscaling_group_name = aws_autoscaling_group.catalogue.name
  name                   = "${local.common_name}-catalogue"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
    
  }  
}

