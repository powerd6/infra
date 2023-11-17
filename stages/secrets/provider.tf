terraform {
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
  token = var.gh_admin_token
}