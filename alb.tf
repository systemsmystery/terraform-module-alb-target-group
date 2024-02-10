resource "aws_lb_target_group" "group" {
  name_prefix = substr(replace(var.domain_name, ".", ""), 0, 5)
  port        = var.port
  protocol    = var.protocol
  vpc_id      = data.aws_vpc.default.id
  health_check {
    path     = var.health_check_path
    port     = coalesce(var.health_check_port, var.port)
    protocol = var.health_check_protocol
    matcher  = var.health_check_matcher
    interval = var.health_check_interval
    timeout  = var.health_check_timeout
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "example" {
  # checkov:skip=CKV2_AWS_15
  count                  = var.use_asg ? 1 : 0
  autoscaling_group_name = var.target_id
  lb_target_group_arn    = aws_lb_target_group.group.arn
}

resource "aws_lb_target_group_attachment" "group" {
  count            = var.use_target_group ? 1 : 0
  target_group_arn = aws_lb_target_group.group.arn
  target_id        = var.target_id
}

resource "aws_lb_listener_rule" "listener_rules" {
  listener_arn = var.listener_arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.group.arn
  }
  condition {
    host_header {
      values = [var.domain_name]
    }
  }
  depends_on = [aws_lb_target_group.group]
}

module "cert" {
  # checkov:skip=CKV_TF_1
  count                   = var.additional_certificate_required ? 1 : 0
  source                  = "gitlab.com/systemsmystery/terraform-module-acm-certificates/aws"
  version                 = "1.0.0"
  certificate_domain_name = var.domain_name
  zone_name               = data.aws_route53_zone.zone.name
}

resource "aws_lb_listener_certificate" "additional_cert" {
  count           = var.additional_certificate_required ? 1 : 0
  certificate_arn = module.cert[0].certificate_arn
  listener_arn    = var.listener_arn
}
