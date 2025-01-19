terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "terraform_state" {

  bucket = "${var.account_number}-terraform-state-bucket"

  tags = local.all_tags

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "${var.account_number}-terraform-state-lock-table"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = local.all_tags
}

resource "aws_budgets_budget" "cost_budget" {
  name         = "${var.account_number}-budget-monthly-costs"
  budget_type  = "COST"
  limit_amount = var.aws_budget_limit
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = var.threshold_value
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = concat([var.primary_email], var.additional_email_list)
  }

}
