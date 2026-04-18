resource "google_project_iam_custom_role" "secret_creator" {
  role_id     = "secretmanager.creator"
  title       = "Secret Creator"
  description = "Allows creation of secrets in secret manager"
  permissions = ["secretmanager.secrets.create"]
}

resource "google_project_iam_member" "github_actions_roles" {
  for_each = toset([
    "roles/serviceusage.serviceUsageConsumer",
    "roles/container.admin",
    "roles/compute.admin",
    "roles/iam.serviceAccountUser",
    "roles/secretmanager.secretVersionManager",
    "roles/secretmanager.secretAccessor",
    "roles/secretmanager.viewer",
    "roles/logging.configWriter",
    "monitoring.notificationChannelViewer",
    "roles/monitoring.alertPolicyViewer"
  ])

  project = var.project_id
  role    = each.key
  member  = google_service_account.eoc_service_account.member

}

resource "google_storage_bucket_iam_member" "tfstate_iam" {
  bucket = data.google_storage_bucket.bootstrap_storage_bucket.name
  role   = "roles/storage.objectAdmin"
  member = google_service_account.eoc_service_account.member
}

resource "google_project_iam_member" "privileged_github_actions_roles" {
  for_each = toset([
    "roles/iam.securityAdmin",
    "roles/serviceusage.serviceUsageConsumer",
    "roles/storage.objectAdmin",
    "roles/iam.roleAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/secretmanager.admin",
    "roles/secretmanager.secretAccessor",
    "roles/secretmanager.viewer"
  ])

  project = var.project_id
  role    = each.key
  member  = google_service_account.privileged_service_account.member
}

resource "google_project_iam_member" "vm_admin_user" {
  project = var.project_id
  role    = "roles/compute.admin"
  member  = "group:google-vm-users@eannaoceallaigh.com"
}

resource "google_project_iam_member" "start_stop_vm" {
  for_each = toset([
    "roles/compute.instanceAdmin",
  ])

  project = var.project_id
  role    = each.key
  member  = "serviceAccount:service-${data.google_project.project.number}@compute-system.iam.gserviceaccount.com"
}