terraform {
  required_version = ">= 1.6.0"
  backend "pg" {
    schema_name = "3-email"
  }
  required_providers {
    gandi = {
      source  = "go-gandi/gandi"
      version = "2.2.4"
    }
    improvmx = {
      source  = "issyl0/improvmx"
      version = "0.6.0"
    }
  }
}

provider "gandi" {
  # must provide GANDI_KEY
}

provider "improvmx" {
  # must provide IMPROVMX_API_TOKEN
}
