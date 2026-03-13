resource "google_project_service" "iam" {
  project = var.project_id
  service = "iam.googleapis.com"
}

resource "google_project_service" "billing" {
  project = var.project_id
  service = "cloudbilling.googleapis.com"
}

resource "google_project_service" "budget" {
  project = var.project_id
  service = "billingbudgets.googleapis.com"
}

resource "google_project_service" "monitoring" {
  project = var.project_id
  service = "monitoring.googleapis.com"
}

resource "google_project_service" "compute" {
  project = var.project_id
  service = "compute.googleapis.com"
}

resource "google_project_service" "kubernetes" {
  project = var.project_id
  service = "container.googleapis.com"
}

resource "google_project_service" "cloudresourcemanager" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "cloudidentity" {
  project = var.project_id
  service = "cloudidentity.googleapis.com"
}

resource "google_project_service" "kms" {
  project = var.project_id
  service = "cloudkms.googleapis.com"
}

resource "google_project_service" "secretmanager" {
  project = var.project_id
  service = "secretmanager.googleapis.com"
}

resource "google_project_service" "orgpolicy" {
  project = var.project_id
  service = "orgpolicy.googleapis.com"
}