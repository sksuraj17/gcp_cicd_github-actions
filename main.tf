provider "google" {
  project = "personal-projects-1702"
  region  = "us-central1"
}

resource "google_compute_instance" "my-instance" {
  name         = "my-instance-01"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }
}

resource "google_storage_bucket" "my-storage-bucket" {
  name          = "my-storage-bucket-for-testing-cicd"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}