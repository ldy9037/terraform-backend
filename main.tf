terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.20.0"
    }
  }

  required_version = ">= 1.1.7"
}

provider "google" {
  region     = var.region
}

module "backend-bucket" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "3.2.0"

    project_id = var.project_id

  names    = [for name in var.state_bucket_name : name]
  prefix   = var.state_bucket_prefix
  location = var.region

  storage_class = var.state_bucket_storage_class
  versioning    = {for name in var.state_bucket_name : name => true}
}
