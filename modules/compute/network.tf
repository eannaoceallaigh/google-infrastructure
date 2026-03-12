resource "google_compute_network" "compute_network" {
  name = "${var.project_name}-${var.instance_name}-network"

  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "compute_subnet" {
  name                     = "${var.project_name}-${var.instance_name}-subnet"
  ip_cidr_range            = "10.0.0.0/16"
  network                  = google_compute_network.compute_network.id
  private_ip_google_access = true
  region                   = var.region
}

resource "google_compute_firewall" "web" {
  name    = "web-${google_compute_network.compute_network.name}"
  network = google_compute_network.compute_network.name
  project = var.project_id

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  priority = 1010

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "ssh" {
  name    = "ssh-${google_compute_network.compute_network.name}"
  network = google_compute_network.compute_network.name
  project = var.project_id

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  priority = 1020

  source_ranges = ["${jsondecode(data.http.api_query.response_body).ip}/32"]
}

resource "google_compute_firewall" "kubectl" {
  name    = "kubectl-${google_compute_network.compute_network.name}"
  network = google_compute_network.compute_network.name
  project = var.project_id

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["6443"]
  }

  priority = 1030

  source_ranges = ["${jsondecode(data.http.api_query.response_body).ip}/32"]
}

resource "google_compute_firewall" "tcp" {
  name    = "${var.component}-tcp-${google_compute_network.compute_network.name}"
  network = google_compute_network.compute_network.name
  project = var.project_id

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["30011", "30033", "31011", "31033"]
  }

  priority = 1040

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "udp" {
  name    = "${var.component}-udp-${google_compute_network.compute_network.name}"
  network = google_compute_network.compute_network.name
  project = var.project_id

  direction = "INGRESS"

  allow {
    protocol = "udp"
    ports    = ["30987", "31987"]
  }

  priority = 1050

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "api" {
  name    = "${var.component}-api-${google_compute_network.compute_network.name}"
  network = google_compute_network.compute_network.name
  project = var.project_id

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["30080", "31080"]
  }

  priority = 1060

  source_ranges = ["${jsondecode(data.http.api_query.response_body).ip}/32"]
}