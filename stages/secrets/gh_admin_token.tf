variable "gh_admin_token" {
  type        = string
  description = "The GitHub super-admin PAT for the organization"
  sensitive   = true
}

resource "github_actions_organization_secret" "gh_admin_token" {
  secret_name     = "GH_ADMIN_TOKEN"
  plaintext_value = var.gh_admin_token
  visibility      = "all"
}