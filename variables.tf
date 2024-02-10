variable "domain_name" {
  type        = string
  description = "The domain name to use for this target group"
}

variable "port" {
  type        = number
  description = "The port to use for this target group"
}

variable "protocol" {
  type        = string
  description = "The protocol to use for this target group"
  validation {
    condition     = can(regex("HTTP|HTTPS", var.protocol))
    error_message = "Protocol must be one of HTTP|HTTPS"
  }
  default = "HTTPS"
}

variable "health_check_path" {
  type        = string
  description = "The health check path to use for this target group"
}

variable "health_check_port" {
  type        = number
  description = "The health check port to use for this target group"
  default     = null
}

variable "health_check_protocol" {
  type        = string
  description = "The health check protocol to use for this target group"
  validation {
    condition     = can(regex("HTTP|HTTPS", var.health_check_protocol))
    error_message = "Health check protocol must be one of HTTP|HTTPS"
  }
  default = "HTTPS"
}

variable "health_check_matcher" {
  type        = string
  description = "The health check matcher to use for this target group"
  default     = "200"
}

variable "health_check_interval" {
  type        = number
  description = "The health check interval to use for this target group"
  default     = 30
}

variable "health_check_timeout" {
  type        = number
  description = "The health check timeout to use for this target group"
  default     = 5
}

variable "target_id" {
  type        = string
  description = "The target id to use for this target group"
}

variable "listener_arn" {
  type        = string
  description = "The listener arn to use for this target group"
}

variable "additional_certificate_required" {
  type        = bool
  description = "Create the additional certificate for the target group"
  default     = true
}

variable "lb_security_group_id" {
  type        = string
  description = "The security group id to use for this target group"
}

variable "target_security_group_id" {
  type        = string
  description = "The security group id used on the target"
}

variable "zone_name" {
  type        = string
  description = "The name of the Route53 zone (if different from domain_name"
  default     = ""
}

variable "load_balancer_arn" {
  type        = string
  description = "The ARN of the load balancer"
}

variable "use_asg" {
  type        = bool
  description = "Is the target group for an ASG"
  default     = true
}

variable "use_target_group" {
  type        = bool
  description = "Is the target group for an ALB"
  default     = false
}

variable "asg_id" {
  type        = string
  description = "The id of the ASG"
  default     = ""
}
