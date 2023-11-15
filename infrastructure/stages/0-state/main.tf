terraform {
  backend "pg" {
    conn_str = "postgres://cornelius.db.elephantsql.com/tbhiqlyj"
    schema_name = "state" # The name of the stage
  }
  required_providers {
    elephantsql = {
      source = "elephantsql/elephantsql"
    }
  }
}

provider "elephantsql" {}
