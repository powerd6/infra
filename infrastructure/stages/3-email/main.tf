terraform {
  required_version = ">= 1.6.0"
  backend "pg" {
  }
  required_providers {
    improvmx = {
      source  = "issyl0/improvmx"
      version = "0.6.0"
    }
  }
}

provider "improvmx" {
}

data "terraform_remote_state" "domain" {
  backend = "pg"
  config = {
    schema_name = "2-domain"
  }
}

locals {
  destination_email = "hector.zacharias@gmail.com"
}

resource "improvmx_domain" "domain" {
  domain             = data.terraform_remote_state.domain.outputs.domain_name
  notification_email = local.destination_email
}
