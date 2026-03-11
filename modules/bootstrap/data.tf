data "google_billing_account" "eoc_billing_account" {
  display_name = "${var.project_name}-billing-account"
}

data "google_storage_bucket" "bootstrap_storage_bucket" {
  name = var.bucket
}

data "google_project" "project" {}