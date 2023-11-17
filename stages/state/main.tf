resource "elephantsql_instance" "tfstate" {
  name   = "tfstate"
  plan   = "turtle" # The free tier
  region = "amazon-web-services::eu-north-1"
}

output "psql_url" {
  value       = elephantsql_instance.tfstate.url
  description = "The connection string for the created PSQL database that wil hold state files."
  sensitive   = true
}