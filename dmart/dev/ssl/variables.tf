variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "application" {
  description = "Application name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string

  validation {
    condition     = contains(["dev", "qa", "uat", "prod"], var.environment)
    error_message = "Environment must be dev, qa, uat, or prod."
  }
}

variable "domain_name" {
  description = "Domain name for ACM certificate"
  type        = string
}
