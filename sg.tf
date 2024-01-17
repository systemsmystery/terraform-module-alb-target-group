resource "aws_vpc_security_group_egress_rule" "egress" {
  description                  = var.domain_name
  security_group_id            = var.lb_security_group_id
  from_port                    = var.port
  to_port                      = var.port
  ip_protocol                  = "tcp"
  referenced_security_group_id = var.target_security_group_id
}

resource "aws_vpc_security_group_egress_rule" "egress_target" {
  description                  = "LB Access"
  security_group_id            = var.target_security_group_id
  from_port                    = var.port
  to_port                      = var.port
  ip_protocol                  = "tcp"
  referenced_security_group_id = var.lb_security_group_id
}

resource "aws_vpc_security_group_ingress_rule" "ingress_target" {
  description                  = "LB Access"
  security_group_id            = var.target_security_group_id
  from_port                    = var.port
  to_port                      = var.port
  ip_protocol                  = "tcp"
  referenced_security_group_id = var.lb_security_group_id
}
