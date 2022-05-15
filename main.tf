terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.20.0"
    }
  }

  backend "gcs" {}

  required_version = ">= 1.1.7"
}

provider "google" {
  region = var.region
}

module "kms" {
  source  = "terraform-google-modules/kms/google"
  version = "2.1.0"

  project_id           = var.project_id
  location             = var.region
  keyring              = var.keyring
  keys                 = [var.key_name]
  set_owners_for       = [var.key_name]
  key_protection_level = var.key_protection_level
  owners               = [for owner in var.key_owners : owner]
  key_algorithm        = var.key_algorithm
  key_rotation_period  = var.key_rotation_period
}

module "backend-bucket" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "3.2.0"

  project_id = var.project_id

  names    = [var.state_bucket_name]
  prefix   = var.state_bucket_prefix
  location = var.region

  encryption_key_names = { "${var.state_bucket_name}" = module.kms.keys[var.key_name]}
  storage_class        = var.state_bucket_storage_class
  versioning           = { "${var.state_bucket_name}" = true }
}