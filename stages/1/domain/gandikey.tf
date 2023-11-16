variable "gandi_key" {
  type = string
  description = "The gandi.net API key"
  sensitive = true
}

output "gandi_key" {
  value       = var.gandi_key
  description = "The gandi.net API key"
  sensitive   = true
}