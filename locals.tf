locals {
  all_tags = {
    Name          = "${var.account_number}-terraform-state-bucket",
    Orchestration = var.orchestration_tag,
    LastUpdated    = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())
  }
}
