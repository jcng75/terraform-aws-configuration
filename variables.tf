variable "aws_region" {
  type        = string
  description = "Region you are using for provising resources"
  default     = "us-east-1"
}

variable "orchestration_tag" {
  type        = string
  description = "Tag used to identify how the resource was created (terraform)"
  default     = "Created by Terraform"
}

variable "account_number" {
  type        = string
  description = "AWS Account Number"
}

variable "read_capacity" {
  type        = number
  description = "Read Capacity of the DynamoDB table"
  default     = 1
}

variable "write_capacity" {
  type        = number
  description = "Write Capacity of the DynamoDB table"
  default     = 1
}

variable "aws_budget_limit" {
  type        = string
  description = "AWS Budget monthly cost limit for account"
  default     = 10
}

variable "threshold_value" {
  type        = number
  description = "Percentage Threshold notification value for triggering"
  default     = 100
}

variable "primary_email" {
  type        = string
  description = "Primary Email of the AWS account - Used for AWS budgets"
}

variable "additional_email_list" {
  type        = list(string)
  description = "List of emails that need to be notiified for budgets"
  default     = []
}
