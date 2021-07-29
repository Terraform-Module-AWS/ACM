variable "create_certificate" {
  description = "Whether to create ACM certificate"
  type        = bool
  default     = false
}

variable "import_certificate" {
  description = "Whether to import certificate into ACM."
  type        = bool
  default     = false
}

variable "validate_certificate" {
  description = "Whether to validate certificate by creating Route53 record"
  type        = bool
  default     = false
}

variable "validation_allow_overwrite_records" {
  description = "Whether to allow overwrite of Route53 records"
  type        = bool
  default     = false
}

variable "wait_for_validation" {
  description = "Whether to wait for the validation to complete"
  type        = bool
  default     = false
}

variable "certificate_transparency_logging_preference" {
  description = "Specifies whether certificate details should be added to a certificate transparency log"
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "A domain name for which the certificate should be issued"
  type        = string
  default     = null
}

variable "subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = list(string)
  default     = []
}

variable "certificate_authority_arn" {
    description = "ARN of an ACMPCA."
    type        = string
    default     = null
}

variable "validation_method" {
  description = "Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform."
  type        = string
  default     = null
}

variable "zone_id" {
  description = "The ID of the hosted zone to contain this record."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "dns_ttl" {
  description = "The TTL of DNS recursive resolvers to cache information about this record."
  type        = number
  default     = 60
}

variable "imported_certificate_body" {
    description = "Certificate body of the certificate to be imported. Must be PEM-formatted."
    default     = null
}

variable "imported_certificate_private_key" {
    description = "Certificate private key of certificate to be imported. Must be PEM-formatted."
    default     = null 
}

variable "imported_certificate_chain" {
    description = "Certificate chain of certificate to be imported. Must be PEM-formatted."
    default     = null
}