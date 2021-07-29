locals {
  # Get distinct list of domains and SANs
  distinct_domain_names = distinct(concat([var.domain_name], [for s in var.subject_alternative_names : replace(s, "*.", "")]))

  # Copy domain_validation_options for the distinct domain names
  validation_domains = var.create_certificate ? [for k, v in aws_acm_certificate.this_create_certificate[0].domain_validation_options : tomap(v) if contains(local.distinct_domain_names, replace(v.domain_name, "*.", ""))] : []
}

resource "aws_acm_certificate" "this_import_certificate" {
  count = var.import_certificate ? 1 : 0

  private_key = var.imported_certificate_private_key
  certificate_body = var.imported_certificate_body
  certificate_chain = var.imported_certificate_chain
  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "this_create_certificate" {
  count = var.create_certificate ? 1 : 0

  # create amacon issued certifcate using ACM
  validation_method         = var.validation_method
  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_preference ? "ENABLED" : "DISABLED"
  }

  # create private CA Issued certificate
  certificate_authority_arn = var.certificate_authority_arn

  # common attributes of certificate creation
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "validation" {
  count = var.create_certificate && var.validation_method == "DNS" && var.validate_certificate ? length(local.distinct_domain_names) + 1 : 0

  zone_id = var.zone_id
  name    = element(local.validation_domains, count.index)["resource_record_name"]
  type    = element(local.validation_domains, count.index)["resource_record_type"]
  ttl     = var.dns_ttl

  records = [
    element(local.validation_domains, count.index)["resource_record_value"]
  ]

  allow_overwrite = var.validation_allow_overwrite_records

  depends_on = [aws_acm_certificate.this_create_certificate]
}

resource "aws_acm_certificate_validation" "this" {
  count = var.create_certificate && var.validation_method == "DNS" && var.validate_certificate && var.wait_for_validation ? 1 : 0

  certificate_arn = aws_acm_certificate.this_create_certificate[0].arn

  validation_record_fqdns = aws_route53_record.validation.*.fqdn
}
