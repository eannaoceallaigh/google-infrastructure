module "compute" {
  source       = "../../modules/compute"
  project_id   = var.project_id
  project_name = var.project_name
  component    = "k8s-cloud-node-00"
  zone         = var.zone
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