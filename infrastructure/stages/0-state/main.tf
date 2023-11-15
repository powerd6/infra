terraform {
  required_providers {
    elephantsql = {
      source = "elephantsql/elephantsql"
    }
  }
}

provider "elephantsql" {
    # must provide ELEPHANTSQL_APIKEY
}

resource "elephantsql_instance" "tfstate" {
  name = "tfstate"
  plan = "turtle" # The free tier
  region = "amazon-web-services::eu-north-1"
}

output "psql_url" {
  value = "${elephantsql_instance.tfstate.url}"
  sensitive = true
}