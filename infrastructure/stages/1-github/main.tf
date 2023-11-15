terraform {
  backend "pg" {
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

resource "github_organization_settings" "powerd6" {
  name          = "powerd6"
  description   = "A remixable TTRPG built for sharing"
  email         = "contact@powerd6.org"
  billing_email = "billing@powerd6.org"
  blog          = "https://powerd6.org"

  has_organization_projects = false
  has_repository_projects   = false

  default_repository_permission = "read"

  members_can_create_repositories          = false
  members_can_create_public_repositories   = false
  members_can_create_private_repositories  = false
  members_can_create_internal_repositories = false
  members_can_create_pages                 = false
  members_can_create_public_pages          = false
  members_can_create_private_pages         = false
  members_can_fork_private_repositories    = false
  web_commit_signoff_required              = true

  advanced_security_enabled_for_new_repositories               = false
  dependabot_alerts_enabled_for_new_repositories               = false
  dependabot_security_updates_enabled_for_new_repositories     = false
  dependency_graph_enabled_for_new_repositories                = false
  secret_scanning_enabled_for_new_repositories                 = true
  secret_scanning_push_protection_enabled_for_new_repositories = true
}

output "gh_org_id" {
  value = github_organization_settings.powerd6.id
}