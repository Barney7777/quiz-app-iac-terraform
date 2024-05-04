# environment variables
variable "region" {
  description = "default region"
  type        = string
}
variable "project_name" {
  description = "project name"
  type        = string
}
variable "environment" {
  description = "environment"
  type        = string
}
variable "domain_name" {
  description = "domain name"
  type        = string
}

# s3 variables

# cloudfront variables
variable "sub_domain_name" {
  description = "sub domain name with www"
  type        = string
}
# acm variables
variable "alternative_name" {
  description = "wildcard subdomain"
  type        = string
}

# route53 variables
variable "record_name" {
  description = "record name"
  type        = string
}




