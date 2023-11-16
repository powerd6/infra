variable "gandi_key" {
  type        = string
  sensitive   = true
  description = "The API key for gandi.net"
}

resource "github_actions_organization_secret" "gandi_key" {
  secret_name     = "GANDI_KEY"
  visibility      = "selected"
  plaintext_value = var.gandi_key
}
