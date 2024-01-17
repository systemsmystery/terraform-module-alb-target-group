# Terraform Module - ALB Target Group

Module to create a ALB Target Group. Used with the ALB module.

## Terraform Resources

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.31.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.31.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert"></a> [cert](#module\_cert) | gitlab.com/systemsmystery/terraform-module-acm-certificates/aws | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_lb_listener_certificate.additional_cert](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/lb_listener_certificate) | resource |
| [aws_lb_listener_rule.listener_rules](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.group](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.group](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/lb_target_group_attachment) | resource |
| [aws_route53_record.record](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route53_record) | resource |
| [aws_vpc_security_group_egress_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.egress_target](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.ingress_target](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_lb.lb](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/lb) | data source |
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/route53_zone) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_certificate_required"></a> [additional\_certificate\_required](#input\_additional\_certificate\_required) | Create the additional certificate for the target group | `bool` | `true` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to use for this target group | `string` | n/a | yes |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | The health check interval to use for this target group | `number` | `30` | no |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | The health check matcher to use for this target group | `string` | `"200"` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | The health check path to use for this target group | `string` | n/a | yes |
| <a name="input_health_check_port"></a> [health\_check\_port](#input\_health\_check\_port) | The health check port to use for this target group | `number` | `null` | no |
| <a name="input_health_check_protocol"></a> [health\_check\_protocol](#input\_health\_check\_protocol) | The health check protocol to use for this target group | `string` | `"HTTPS"` | no |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | The health check timeout to use for this target group | `number` | `5` | no |
| <a name="input_lb_security_group_id"></a> [lb\_security\_group\_id](#input\_lb\_security\_group\_id) | The security group id to use for this target group | `string` | n/a | yes |
| <a name="input_listener_arn"></a> [listener\_arn](#input\_listener\_arn) | The listener arn to use for this target group | `string` | n/a | yes |
| <a name="input_load_balancer_arn"></a> [load\_balancer\_arn](#input\_load\_balancer\_arn) | The ARN of the load balancer | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | The port to use for this target group | `number` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The protocol to use for this target group | `string` | `"HTTPS"` | no |
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | The target id to use for this target group | `string` | n/a | yes |
| <a name="input_target_security_group_id"></a> [target\_security\_group\_id](#input\_target\_security\_group\_id) | The security group id used on the target | `string` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | The name of the Route53 zone (if different from domain\_name | `string` | `""` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
