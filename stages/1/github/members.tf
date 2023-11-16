variable "members" {
  type        = set(string)
  default     = []
  description = "A list of GitHub username that should be members of the organization. Administrators do not need to be included here."
}

resource "github_membership" "members" {
  depends_on = [github_organization_settings.powerd6]
  for_each   = var.members
  username   = each.value
  role       = "member"
}

variable "administrators" {
  type        = set(string)
  default     = []
  description = "A list of GitHub username that should be administrators in the organization"
}

resource "github_membership" "admins" {
  depends_on = [github_organization_settings.powerd6]
  for_each   = var.administrators
  username   = each.value
  role       = "admin"
}

output "administators" {
  value       = values({ for user in var.administrators : user => "/${user}" })
  description = "The list of administrators for the organization, in the format '/username'."
  sensitive   = true
}