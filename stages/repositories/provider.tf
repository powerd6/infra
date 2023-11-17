terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.42.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

variable "gh_admin_token" {
  type        = string
  description = "The GitHub super-admin PAT for the organization"
  sensitive   = true
}

# Configure the GitHub Provider
provider "github" {
  owner = "powerd6" # This stage runs as the powerd6 organization
  token = var.gh_admin_token
}