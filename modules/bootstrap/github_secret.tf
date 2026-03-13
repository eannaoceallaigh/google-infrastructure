resource "github_actions_organization_secret" "actions_secret" {
  for_each = {
    BUCKET                      = data.google_storage_bucket.bootstrap_storage_bucket.name
    PROJECT_ID                  = var.project_id
    REGION                      = var.region
    ZONE                        = var.zone
    SERVICE_ACCOUNT             = google_service_account.eoc_service_account.email
    IDENTITY_POOL_ID            = google_iam_workload_identity_pool_provider.github_actions.name
    PRIVILEGED_SERVICE_ACCOUNT  = google_service_account.privileged_service_account.email
    PRIVILEGED_IDENTITY_POOL_ID = google_iam_workload_identity_pool_provider.privileged_github_actions.name
  }

  visibility      = "selected"
  secret_name     = each.key
  plaintext_value = each.value
}

resource "github_actions_organization_secret_repositories" "secrets_repo_access" {
  for_each = {
    BUCKET                      = data.google_storage_bucket.bootstrap_storage_bucket.name
    PROJECT_ID                  = var.project_id
    REGION                      = var.region
    ZONE                        = var.zone
    SERVICE_ACCOUNT             = google_service_account.eoc_service_account.email
    IDENTITY_POOL_ID            = google_iam_workload_identity_pool_provider.github_actions.name
    PRIVILEGED_SERVICE_ACCOUNT  = google_service_account.privileged_service_account.email
    PRIVILEGED_IDENTITY_POOL_ID = google_iam_workload_identity_pool_provider.privileged_github_actions.name
  }
  secret_name             = github_actions_organization_secret.actions_secret[each.key].secret_name
  selected_repository_ids = [ 
    data.github_repository.github_repository.repo_id 
  ]
}