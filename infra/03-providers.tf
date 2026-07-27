# 03-providers.tf

terraform {
  required_version = ">= 1.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = local.aws_region

  default_tags {
    tags = local.default_tags
  }
}
