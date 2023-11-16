variable "elephantsql_api_key" {
  type = string
  description = "The ElephantSQL API key used to provision PSQL databases."
  sensitive = true
}

output "elephantsql_api_key" {
  value       = var.elephantsql_api_key
  description = "The ElephantSQL API key used to provision PSQL databases."
  sensitive   = true
}