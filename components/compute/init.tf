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
      version = "6.34.0"
    }
    github = {
      source  = "integrations/github"
      version = "5.45.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
  backend "gcs" {}
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}