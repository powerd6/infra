variable "improvmx_api_token" {
  type        = string
  sensitive   = true
  description = "The API key for gandi.net"
}

resource "github_actions_organization_secret" "improvmx_api_token" {
  secret_name     = "IMPROVMX_API_TOKEN"
  visibility      = "selected"
  plaintext_value = var.improvmx_api_token
}