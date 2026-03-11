resource "google_service_account" "compute_gsa" {
  project      = var.project_id
  account_id   = "${var.project_name}-compute-gsa"
  display_name = "Custom compute service account"
}

resource "google_project_iam_member" "compute_gsa_iam_member" {
  project = var.project_id
  count   = length(var.iam_roles_list)
  role    = var.iam_roles_list[count.index]
  member  = "serviceAccount:${google_service_account.compute_gsa.email}"
}

#-------------------------------------
# Workload Identity
#-------------------------------------
resource "google_service_account" "wi_gsa" {
  project      = var.project_id
  account_id   = "wi-gsa"
  display_name = "Workload Identity Google service account"
}

resource "google_project_iam_member" "wi_gsa_iam_member" {
  project = var.project_id
  count   = length(var.wi_iam_roles_list)
  role    = var.wi_iam_roles_list[count.index]
  member  = "serviceAccount:${google_service_account.wi_gsa.email}"
}

resource "google_project_iam_custom_role" "compute_contributor" {
  role_id = "compute_contributor"
  title   = "Compute Contributor"

  project = var.project_id

  permissions = [
    "compute.addresses.list",
    "compute.instances.addAccessConfig",
    "compute.instances.deleteAccessConfig",
    "compute.instances.get",
    "compute.instances.list",
    "compute.projects.get",
    "container.clusters.get",
    "container.clusters.list",
    "resourcemanager.projects.get",
    "compute.networks.useExternalIp",
    "compute.subnetworks.useExternalIp",
    "compute.addresses.use",
  ]
}

# compute service account
resource "google_service_account" "compute" {
  account_id   = "compute-serviceaccount"
  display_name = "Compute service account"
  project      = var.project_id
  depends_on   = [google_project_iam_custom_role.compute_contributor]
}

resource "google_project_iam_member" "iam_member_compute" {

  role       = "projects/${var.project_id}/roles/compute_contributor"
  project    = var.project_id
  member     = "serviceAccount:compute-serviceaccount@${var.project_id}.iam.gserviceaccount.com"
  depends_on = [google_service_account.compute]
}