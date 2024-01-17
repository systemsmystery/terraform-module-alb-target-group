data "aws_route53_zone" "zone" {
  name = coalesce(var.zone_name, var.domain_name)
}

data "aws_lb" "lb" {
  arn = var.load_balancer_arn
}

data "aws_vpc" "default" {
  default = true
}
