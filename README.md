# Terraform Module for AWS ACM
Extension of [terraform-aws-modules/terraform-aws-acm](https://github.com/terraform-aws-modules/terraform-aws-acm) with additional import of certificates 

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.53 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.53 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this_create_certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate.this_import_certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_authority_arn"></a> [certificate\_authority\_arn](#input\_certificate\_authority\_arn) | ARN of an ACMPCA. | `string` | `null` | no |
| <a name="input_certificate_transparency_logging_preference"></a> [certificate\_transparency\_logging\_preference](#input\_certificate\_transparency\_logging\_preference) | Specifies whether certificate details should be added to a certificate transparency log | `bool` | `false` | no |
| <a name="input_create_certificate"></a> [create\_certificate](#input\_create\_certificate) | Whether to create ACM certificate | `bool` | `false` | no |
| <a name="input_dns_ttl"></a> [dns\_ttl](#input\_dns\_ttl) | The TTL of DNS recursive resolvers to cache information about this record. | `number` | `60` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | A domain name for which the certificate should be issued | `string` | `null` | no |
| <a name="input_import_certificate"></a> [import\_certificate](#input\_import\_certificate) | Whether to import certificate into ACM. | `bool` | `false` | no |
| <a name="input_imported_certificate_body"></a> [imported\_certificate\_body](#input\_imported\_certificate\_body) | Certificate body of the certificate to be imported. Must be PEM-formatted. | `any` | `null` | no |
| <a name="input_imported_certificate_chain"></a> [imported\_certificate\_chain](#input\_imported\_certificate\_chain) | Certificate chain of certificate to be imported. Must be PEM-formatted. | `any` | `null` | no |
| <a name="input_imported_certificate_private_key"></a> [imported\_certificate\_private\_key](#input\_imported\_certificate\_private\_key) | Certificate private key of certificate to be imported. Must be PEM-formatted. | `any` | `null` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | A list of domains that should be SANs in the issued certificate | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_validate_certificate"></a> [validate\_certificate](#input\_validate\_certificate) | Whether to validate certificate by creating Route53 record | `bool` | `false` | no |
| <a name="input_validation_allow_overwrite_records"></a> [validation\_allow\_overwrite\_records](#input\_validation\_allow\_overwrite\_records) | Whether to allow overwrite of Route53 records | `bool` | `false` | no |
| <a name="input_validation_method"></a> [validation\_method](#input\_validation\_method) | Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform. | `string` | `null` | no |
| <a name="input_wait_for_validation"></a> [wait\_for\_validation](#input\_wait\_for\_validation) | Whether to wait for the validation to complete | `bool` | `false` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The ID of the hosted zone to contain this record. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_distinct_domain_names"></a> [distinct\_domain\_names](#output\_distinct\_domain\_names) | List of distinct domains names used for the validation. |
| <a name="output_this_acm_certificate_domain_validation_options"></a> [this\_acm\_certificate\_domain\_validation\_options](#output\_this\_acm\_certificate\_domain\_validation\_options) | A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used. |
| <a name="output_this_acm_certificate_validation_emails"></a> [this\_acm\_certificate\_validation\_emails](#output\_this\_acm\_certificate\_validation\_emails) | A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used. |
| <a name="output_this_created_acm_certificate_arn"></a> [this\_created\_acm\_certificate\_arn](#output\_this\_created\_acm\_certificate\_arn) | The ARN of the certificate |
| <a name="output_this_imported_acm_certificate_arn"></a> [this\_imported\_acm\_certificate\_arn](#output\_this\_imported\_acm\_certificate\_arn) | The ARN of the imported certificate. |
| <a name="output_this_imported_acm_domain_name"></a> [this\_imported\_acm\_domain\_name](#output\_this\_imported\_acm\_domain\_name) | Domain name of the imported certificate. |
| <a name="output_this_imported_acm_id"></a> [this\_imported\_acm\_id](#output\_this\_imported\_acm\_id) | ID of the imported certificate. |
| <a name="output_this_imported_acm_status"></a> [this\_imported\_acm\_status](#output\_this\_imported\_acm\_status) | Status of the imported certificate. |
| <a name="output_validation_domains"></a> [validation\_domains](#output\_validation\_domains) | List of distinct domain validation options. This is useful if subject alternative names contain wildcards. |
| <a name="output_validation_route53_record_fqdns"></a> [validation\_route53\_record\_fqdns](#output\_validation\_route53\_record\_fqdns) | List of FQDNs built using the zone domain and name. |

### Changelog

* [ACM.0.0.1] Initial ACM commit

