terraform {
  required_providers {
    gandi = {
      source  = "go-gandi/gandi"
      version = "2.2.4"
    }
    improvmx = {
      source = "issyl0/improvmx"
      version = "0.6.0"
    }
  }
}

variable "gandi_key" {
  type        = string
  description = "The gandi.net API key"
  sensitive   = true
}

variable "improvm_api_token" {
  type        = string
  description = "The ImprovMX API token"
  sensitive   = true
}

provider "gandi" {
  key = var.gandi_key
}

provider "improvmx" {
  token = var.improvm_api_token
}