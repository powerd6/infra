variable "pg_conn_str" {
  type        = string
  sensitive   = true
  description = "The PSQL connection string"
}

resource "github_actions_organization_secret" "pg_conn_str" {
  secret_name     = "PG_CONN_STR"
  visibility      = "selected"
  plaintext_value = var.pg_conn_str
}