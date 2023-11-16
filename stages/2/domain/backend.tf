terraform {
  required_version = ">= 1.6.0"
  backend "pg" {
    schema_name = "2-domain"
  }
  required_providers {
    gandi = {
      source  = "go-gandi/gandi"
      version = "2.2.4"
    }
  }
}

provider "gandi" {
  # must provide GANDI_KEY
}