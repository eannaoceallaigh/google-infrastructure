provider "google" {
  project               = var.project_id
  region                = var.region
  zone                  = "${var.region}-${var.zone}"
  user_project_override = true
  billing_project       = var.project_id
}

provider "github" {}

terraform {

  required_version = ">= 1.3.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.45.2"
    }
    github = {
      source  = "integrations/github"
      version = "6.11.0"
    }
  }
  backend "gcs" {}
}