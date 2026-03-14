resource "tls_private_key" "private_key" {
  algorithm = "ED25519"
}

resource "google_secret_manager_regional_secret" "ssh_private_key" {
  secret_id = "${var.instance_name}-private-key"
  location  = var.region
}

resource "google_secret_manager_regional_secret_version" "ssh_private_key_openssh" {
  secret      = google_secret_manager_regional_secret.ssh_private_key.id
  secret_data = tls_private_key.private_key.private_key_openssh
}

resource "google_secret_manager_regional_secret" "ssh_public_key" {
  secret_id = "${var.instance_name}-public-key"
  location  = var.region
}

resource "google_secret_manager_regional_secret_version" "ssh_public_key_openssh" {
  secret      = google_secret_manager_regional_secret.ssh_public_key.id
  secret_data = tls_private_key.private_key.public_key_openssh
}

resource "google_secret_manager_regional_secret" "ip_address" {
  secret_id = "${var.instance_name}-ip-address"
  location  = var.region
}

resource "google_secret_manager_regional_secret_version" "ip_address" {
  secret      = google_secret_manager_regional_secret.ip_address.id
  secret_data = google_compute_instance.compute_instance.network_interface.0.access_config.0.nat_ip
}