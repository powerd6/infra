terraform {
  required_version = ">= 1.6.0"
  backend "pg" {
    schema_name = "1-github"
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.42.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  owner = "powerd6" # This stage runs as the powerd6 organization
}