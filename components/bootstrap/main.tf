module "bootstrap" {
  source              = "../../modules/bootstrap"
  project_id          = var.project_id
  project_name        = var.project_name
  github_repository   = var.github_repository
  github_organisation = var.github_organisation
  bucket              = var.bucket
  email_address       = var.email_address
}