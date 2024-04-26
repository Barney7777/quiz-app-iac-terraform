# environment Variables
variable "region" {
  description = "region to create resources"
  type        = string
  #   default = "ap-southeast-2" use terraform.tfvars to pass value for variables
}

variable "project_name" {
  description = "project name"
  type        = string
}

variable "environment" {
  description = "environment"
  type        = string
}

# VPC variables
variable "vpc_cidr" {
  description = "vpc cidr block"
  type        = string
}

variable "public_subnet_az1_cidr" {
  description = "public subnet az1 cidr block"
  type        = string
}

variable "public_subnet_az2_cidr" {
  description = "public subnet az2 cidr block"
  type        = string
}

variable "private_app_subnet_az1_cidr" {
  description = "private app subnet az1 cidr block"
  type        = string
}

variable "private_app_subnet_az2_cidr" {
  description = "private app subnet az2 cidr block"
  type        = string
}

# route53 variables
variable "hosted_zone_name" {
  description = "hosted zone name"
  type        = string
}
variable "record_name" {
  description = "record name"
  type        = string
}

# ACM variables
variable "subdomain_name" {
  description = "subdomain to point to alb dns"

}

# ecs variables
variable "architecture" {
  description = "ecs cpu architecture"
  type        = string
}

variable "container_image" {
  description = "container image ami"
  type        = string
}
