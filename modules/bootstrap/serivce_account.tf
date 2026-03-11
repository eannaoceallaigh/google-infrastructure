resource "google_service_account" "eoc_service_account" {
  account_id   = "github-service-account"
  display_name = "Service account for use with GitHub Actions - Not Privileged"
  project      = var.project_id
}

resource "google_service_account" "privileged_service_account" {
  account_id   = "github-privileged-gsa"
  display_name = "Service account for use with GitHub Actions - Privileged"
  project      = var.project_id
}