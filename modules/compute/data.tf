data "google_secret_manager_regional_secret_version" "vault_password" {
  secret   = "vault-password"
  location = var.region
}

data "google_secret_manager_regional_secret_version" "admin_user" {
  secret   = "admin-user"
  location = var.region
}

data "http" "api_query" {
  url = "https://ipinfo.io/json"
}

data "google_monitoring_notification_channel" "eoc_notification_channel" {
  display_name = "${var.project_name}-notification-channel"
}