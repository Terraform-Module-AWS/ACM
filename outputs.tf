output "this_imported_acm_certificate_arn" {
  description = "The ARN of the imported certificate."
  value       = element(concat(aws_acm_certificate.this_import_certificate.*.arn, [""]), 0)
}

output "this_imported_acm_status" {
  description = "Status of the imported certificate."
  value       = element(concat(aws_acm_certificate.this_import_certificate.*.status, [""]), 0)
}


output "this_imported_acm_id" {
  description = "ID of the imported certificate."
  value       = element(concat(aws_acm_certificate.this_import_certificate.*.id, [""]), 0)
}


output "this_imported_acm_domain_name" {
  description = "Domain name of the imported certificate."
  value       = element(concat(aws_acm_certificate.this_import_certificate.*.domain_name, [""]), 0)
}

output "this_created_acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = element(concat(aws_acm_certificate_validation.this.*.certificate_arn, aws_acm_certificate.this_create_certificate.*.arn, [""]), 0)
}

output "this_acm_certificate_domain_validation_options" {
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used."
  value       = flatten(aws_acm_certificate.this_create_certificate.*.domain_validation_options)
}

output "this_acm_certificate_validation_emails" {
  description = "A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used."
  value       = flatten(aws_acm_certificate.this_create_certificate.*.validation_emails)
}

output "validation_route53_record_fqdns" {
  description = "List of FQDNs built using the zone domain and name."
  value       = aws_route53_record.validation.*.fqdn
}

output "distinct_domain_names" {
  description = "List of distinct domains names used for the validation."
  value       = local.distinct_domain_names
}

output "validation_domains" {
  description = "List of distinct domain validation options. This is useful if subject alternative names contain wildcards."
  value       = local.validation_domains
}
