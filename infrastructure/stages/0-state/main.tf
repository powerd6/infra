terraform {
  required_version = ">= 1.6.0"
  required_providers {
    elephantsql = {
      source  = "elephantsql/elephantsql"
      version = "0.0.1"
    }
  }
}

provider "elephantsql" {
  # must provide ELEPHANTSQL_APIKEY
}

resource "elephantsql_instance" "tfstate" {
  name   = "tfstate"
  plan   = "turtle" # The free tier
  region = "amazon-web-services::eu-north-1"
}

output "psql_url" {
  value       = elephantsql_instance.tfstate.url
  description = "The connection string for the created PSQL database that wil hold state files."
  sensitive   = true
}