output "bucket_id" {
  description = "ID of the Bucket"
  value       = aws_s3_bucket.terraform_state.id
}

output "bucket_arn" {
  description = "ARN of the Bucket"
  value       = aws_s3_bucket.terraform_state.arn
}

output "dynamodb_arn" {
  description = "ARN of the DynamoDB table"
  value       = aws_dynamodb_table.terraform_state_lock.arn
}

output "buget_arn" {
  description = "Budget ARN for costs"
  value       = aws_budgets_budget.cost_budget.arn
}

output "budget_limit" {
  description = "Value of the current monthly budget limit"
  value       = aws_budgets_budget.cost_budget.limit_amount
}
