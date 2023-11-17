variable "gh_admin_token" {
  type        = string
  description = "The GitHub super-admin PAT for the organization"
  sensitive   = true
}

output "gh_admin_token" {
  value       = var.gh_admin_token
  description = "The GitHub super-admin PAT for the organization"
  sensitive   = true
}