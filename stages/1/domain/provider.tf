terraform {
  required_providers {
    gandi = {
      source  = "go-gandi/gandi"
      version = "2.2.4"
    }
  }
}

provider "gandi" {
  key = var.gandi_key
}