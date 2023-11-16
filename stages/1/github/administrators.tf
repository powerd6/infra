variable "administrators" {
  type        = set(string)
  default     = toset([])
  description = "A list of GitHub username that should be administrators in the organization"
}

resource "github_membership" "admins" {
  for_each = var.administrators
  username = each.value
  role     = "admin"
}

output "administators" {
  value       = values({ for user in var.administrators : user => "/${user}" })
  description = "The list of administrators for the organization, in the format `/${username}`."
  sensitive   = true
}