provider "google" {
  project               = var.project_id
  region                = var.region
  zone                  = "${var.region}-${var.zone}"
  user_project_override = true
  billing_project       = var.project_id
}

terraform {

  required_version = ">= 1.3.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.5.0"
    }
  }
  backend "gcs" {}
}