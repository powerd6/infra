terraform {
  required_providers {
    gandi = {
      source  = "go-gandi/gandi"
      version = "2.2.4"
    }
    github = {
      source  = "integrations/github"
      version = "5.42.0"
    }
  }
}

variable "gandi_key" {
  type        = string
  description = "The gandi.net API key"
  sensitive   = true
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

provider "gandi" {
  key = var.gandi_key
}
