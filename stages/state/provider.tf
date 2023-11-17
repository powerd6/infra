terraform {
  required_providers {
    elephantsql = {
      source  = "elephantsql/elephantsql"
      version = "0.0.1"
    }
  }
}

provider "elephantsql" {
  apikey = var.elephantsql_api_key
}
