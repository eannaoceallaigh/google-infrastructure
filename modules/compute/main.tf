resource "google_compute_instance" "compute_instance" {
  name         = var.instance_name
  machine_type = "e2-medium"
  zone         = "${var.region}-${var.zone}"

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2404-lts-amd64"
      size  = 30
      type  = "pd-standard"
    }
  }

  metadata = {
    ssh-keys = "${data.google_secret_manager_regional_secret_version.admin_user.secret_data}:${trimspace(tls_private_key.private_key.public_key_openssh)}"
  }

  network_interface {
    network    = google_compute_network.compute_network.id
    subnetwork = google_compute_subnetwork.compute_subnet.id

    access_config {}
  }

  resource_policies = [
    google_compute_resource_policy.auto_start_and_stop.id
  ]

  scheduling {
    preemptible        = true
    automatic_restart  = false
    provisioning_model = "SPOT"
  }

  shielded_instance_config {
    enable_secure_boot = true
  }
}

resource "google_compute_resource_policy" "auto_start_and_stop" {
  name   = "${var.project_name}-${var.instance_name}-policy"
  region = var.region
  instance_schedule_policy {
    vm_start_schedule {
      schedule = "00 19 * * *"
    }
    vm_stop_schedule {
      schedule = "00 03 * * *"
    }

    time_zone = "Europe/Dublin"
  }
}
