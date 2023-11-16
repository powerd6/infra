variable "gh_org_admin" {
  type        = string
  sensitive   = true
  description = "The PAT from GitHub with admin privileges"
}

resource "github_actions_organization_secret" "gh_org_admin" {
  secret_name     = "GH_ORG_ADMIN"
  visibility      = "selected"
  plaintext_value = var.gh_org_admin
}