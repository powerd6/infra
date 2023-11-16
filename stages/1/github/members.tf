variable "members" {
  type        = set(string)
  default     = toset([])
  description = "A list of GitHub username that should be members of the organization. Administrators do not need to be included here."
}

resource "github_membership" "members" {
  for_each = var.members
  username = each.value
  role     = "member"
}
