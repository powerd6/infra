variable "elephantsql_api_key" {
  type        = string
  sensitive   = true
  description = "The ElephantSQL API key used to provision PSQL databases."
}

resource "github_actions_organization_secret" "elephantsql_api_key" {
  secret_name     = "ELEPHANTSQL_APIKEY"
  plaintext_value = var.elephantsql_api_key
  visibility      = "all"
}