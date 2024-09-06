terraform {
  required_version = "< 2.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.82.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
    }
  }
}

data "google_client_config" "default" {}

provider "google" {
  project = "nitrado-b2b-shared"
  region = "europe-west3"
}

data "google_container_cluster" "b2b_shared" {
  name     = "b2b-ci"
}

output "endpoint" {
  value = data.google_container_cluster.b2b_shared.endpoint
}

