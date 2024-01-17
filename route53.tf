resource "aws_route53_record" "record" {
  name    = var.domain_name
  type    = "A"
  zone_id = data.aws_route53_zone.zone.zone_id
  alias {
    evaluate_target_health = false
    name                   = data.aws_lb.lb.dns_name
    zone_id                = data.aws_lb.lb.zone_id
  }
}