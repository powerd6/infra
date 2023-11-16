variable "elephantsql_api_key" {
  type        = string
  description = "The ElephantSQL API key used to provision PSQL databases."
  sensitive   = true
  validation {
    condition = var.elephantsql_api_key != ""
    error_message = "The variable elephantsql_api_key is mandatory. Provide it with the environment variable 'ELEPHANTSQL_APIKEY'"
  }
}

output "elephantsql_api_key" {
  value       = var.elephantsql_api_key
  description = "The ElephantSQL API key used to provision PSQL databases."
  sensitive   = true
}