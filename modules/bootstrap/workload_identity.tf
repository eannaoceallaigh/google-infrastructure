resource "google_iam_workload_identity_pool" "wif_pool" {
  workload_identity_pool_id = "wif-pool"
}

resource "google_iam_workload_identity_pool_provider" "github_actions" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.wif_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions"
  display_name                       = "github-actions"
  description                        = "Allows access from github actions to google cloud platform"

  attribute_condition = <<EOT
      assertion.repository_owner == "${var.github_organisation}" &&
      attribute.repository == "${var.github_organisation}/${var.github_repository}"
    EOT

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_member" "wif_gh_actions" {
  service_account_id = google_service_account.eoc_service_account.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.wif_pool.name}/attribute.repository/${var.github_organisation}/${var.github_repository}"
}

resource "google_iam_workload_identity_pool" "privileged_wif_pool" {
  workload_identity_pool_id = "privileged-wif-pool"
}

resource "google_iam_workload_identity_pool_provider" "privileged_github_actions" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.privileged_wif_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "privileged-github-actions"
  display_name                       = "privileged-github-actions"
  description                        = "Allows access from github actions to google cloud platform with extra privileges"

  attribute_condition = <<EOT
      assertion.repository_owner == "${var.github_organisation}" &&
      attribute.repository == "${var.github_organisation}/${var.github_repository}"
    EOT

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_member" "privileged_wif_gh_actions" {
  service_account_id = google_service_account.privileged_service_account.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.privileged_wif_pool.name}/attribute.repository/${var.github_organisation}/${var.github_repository}"
}