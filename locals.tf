locals {
  all_tags = {
    Name          = "${var.account_number}-terraform-state-bucket",
    Orchestration = var.orchestration_tag,
    Created_On    = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())
  }
}
