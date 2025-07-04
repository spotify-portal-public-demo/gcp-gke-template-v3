terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.30.0"
    }
  }

  backend "gcs" {
    bucket = "spotify-portal-public-demo-terraform"
    prefix = "${{ values.component_id }}"
  }
}

provider "google" {
  project = "spotify-portal-public-demo"
  region  = "${{ values.region }}"
}

resource "google_container_cluster" "${{ values.component_id }}" {
  name = "${{ values.component_id }}"

  location         = "${{ values.region }}"
  enable_autopilot = true

  deletion_protection = true
}
