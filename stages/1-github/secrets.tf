# TODO: Consoder moving this into a separate stage
variable "elephantsql_api_key" {
  type        = string
  sensitive   = true
  description = "The ElephantSQL API key used to provision PSQL databases."
}

resource "github_actions_organization_secret" "elephantsql_api_key" {
  secret_name = "ELEPHANTSQL_APIKEY"
  visibility  = "selected"
  selected_repository_ids = [
    module.infrastructure.repo_id
  ]
  plaintext_value = var.elephantsql_api_key
}

variable "pg_conn_str" {
  type        = string
  sensitive   = true
  description = "The PSQL connection string"
}

resource "github_actions_organization_secret" "pg_conn_str" {
  secret_name = "PG_CONN_STR"
  visibility  = "selected"
  selected_repository_ids = [
    module.infrastructure.repo_id
  ]
  plaintext_value = var.pg_conn_str
}


variable "gh_org_admin" {
  type        = string
  sensitive   = true
  description = "The PAT from GitHub with admin privileges"
}

resource "github_actions_organization_secret" "gh_org_admin" {
  secret_name = "GH_ORG_ADMIN"
  visibility  = "selected"
  selected_repository_ids = [
    module.infrastructure.repo_id
  ]
  plaintext_value = var.gh_org_admin
}


variable "gandi_key" {
  type        = string
  sensitive   = true
  description = "The API key for gandi.net"
}

resource "github_actions_organization_secret" "gandi_key" {
  secret_name = "GANDI_KEY"
  visibility  = "selected"
  selected_repository_ids = [
    module.infrastructure.repo_id
  ]
  plaintext_value = var.gandi_key
}


variable "improvmx_api_token" {
  type        = string
  sensitive   = true
  description = "The API key for gandi.net"
}

resource "github_actions_organization_secret" "improvmx_api_token" {
  secret_name = "IMPROVMX_API_TOKEN"
  visibility  = "selected"
  selected_repository_ids = [
    module.infrastructure.repo_id
  ]
  plaintext_value = var.improvmx_api_token
}



