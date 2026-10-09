output "certificate_arn" {
  description = "ACM certificate ARN"
  value       = module.ssl.certificate_arn
}

output "certificate_domain" {
  description = "ACM certificate domain"
  value       = module.ssl.domain_name
}

output "certificate_status" {
  description = "ACM certificate status"
  value       = module.ssl.status
}