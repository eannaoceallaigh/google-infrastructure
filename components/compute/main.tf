module "compute" {
  source        = "../../modules/compute"
  project_id    = var.project_id
  project_name  = var.project_name
  component     = var.component
  instance_name = var.instance_name
  zone          = var.zone
}

data "google_secret_manager_regional_secret_version" "cloudflare_zone_id" {
  secret   = "cloudflare-dns-zone-id"
  location = var.region
}

module "dns" {
  source    = "../../modules/dns"
  ip        = module.compute.vm_ip
  zone_id   = data.google_secret_manager_regional_secret_version.cloudflare_zone_id.secret_data
  component = var.component
  domain    = var.domain

  depends_on = [module.compute]
}