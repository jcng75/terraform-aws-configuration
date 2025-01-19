### terraform-aws-configuration

This repo was created to help create the initial setup of your AWS account with Terraform.  The repo creates the state bucket, lock table, and budgets to ensure you manage your monthly costs on your AWS account.

### Usage

Run the `terraform init` and `terraform apply`.  Make sure to fill in the inputs for your AWS account number and primary email.
Once the resources have been created, you can use the state management in other projects.  Add the *backend* block to your terraform block:
```
terraform {
  backend "s3" {
    bucket = "xxxxxxxxxxxx-terraform-state-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "xxxxxxxxxxxx-terraform-state-lock-table"
  }
}
```
When running the applies, observe that your terraform.tfstate file will now save in your S3 bucket!  Also, each time a terraform plan/apply occurs, the state will be locked through the DynamoDB table!

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.cost_budget](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_dynamodb_table.terraform_state_lock](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_s3_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_number"></a> [account\_number](#input\_account\_number) | AWS Account Number | `string` | n/a | yes |
| <a name="input_additional_email_list"></a> [additional\_email\_list](#input\_additional\_email\_list) | List of emails that need to be notiified for budgets | `list(string)` | `[]` | no |
| <a name="input_aws_budget_limit"></a> [aws\_budget\_limit](#input\_aws\_budget\_limit) | AWS Budget monthly cost limit for account | `string` | `10` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region you are using for provising resources | `string` | `"us-east-1"` | no |
| <a name="input_orchestration_tag"></a> [orchestration\_tag](#input\_orchestration\_tag) | Tag used to identify how the resource was created (terraform) | `string` | `"Created by Terraform"` | no |
| <a name="input_primary_email"></a> [primary\_email](#input\_primary\_email) | Primary Email of the AWS account - Used for AWS budgets | `string` | n/a | yes |
| <a name="input_read_capacity"></a> [read\_capacity](#input\_read\_capacity) | Read Capacity of the DynamoDB table | `number` | `1` | no |
| <a name="input_threshold_value"></a> [threshold\_value](#input\_threshold\_value) | Percentage Threshold notification value for triggering | `number` | `100` | no |
| <a name="input_write_capacity"></a> [write\_capacity](#input\_write\_capacity) | Write Capacity of the DynamoDB table | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN of the Bucket |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | ID of the Bucket |
| <a name="output_budget_limit"></a> [budget\_limit](#output\_budget\_limit) | Value of the current monthly budget limit |
| <a name="output_buget_arn"></a> [buget\_arn](#output\_buget\_arn) | Budget ARN for costs |
| <a name="output_dynamodb_arn"></a> [dynamodb\_arn](#output\_dynamodb\_arn) | ARN of the DynamoDB table |
