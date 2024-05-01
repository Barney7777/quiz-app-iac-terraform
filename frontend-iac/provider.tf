provider "aws" {
  region = var.region

  default_tags {
    tags = {
      "Automation"  = "Terraform"
      "Project"     = "React-Frontend"
      "Environment" = "dev"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "use1"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}