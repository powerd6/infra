locals {
  admins = toset([
    "HectorCastelli"
  ])
  members = toset([])
}

resource "github_membership" "admins" {
  for_each = local.admins
  username = each.value
  role     = "admin"
}

resource "github_membership" "members" {
  for_each = local.members
  username = each.value
  role     = "member"
}

output "administators" {
  value       = local.admins
  description = "The list of administrators for the organization."
  sensitive   = true
}