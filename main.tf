provider "google" {
  project = "personal-projects-1702"
  region  = "us-central1"
}

resource "google_storage_bucket" "my-bucket" {
  name          = "my-bucket-for-cicd-test-gcp"
  location      = "US"
  force_destroy = true
}