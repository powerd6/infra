terraform {
  required_version = ">= 1.6.0"
  backend "pg" {
    schema_name = "0-state"
  }
  required_providers {
    elephantsql = {
      source  = "elephantsql/elephantsql"
      version = "0.0.1"
    }
  }
}