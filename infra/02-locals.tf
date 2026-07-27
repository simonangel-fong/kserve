# 02-locals.tf

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

locals {
  # ##############################
  # Metadata
  # ##############################
  project     = "kserve"
  prefix_name = "${local.project}-${var.env}"

  # ##############################
  # Providers
  # ##############################
  aws_region = "us-east-1"
  default_tags = {
    Project   = local.project
    Env       = var.env
    ManagedBy = "Terraform"
  }
}
