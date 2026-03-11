resource "github_actions_secret" "actions_secret" {
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

  repository      = var.github_repository
  secret_name     = each.key
  plaintext_value = each.value
}