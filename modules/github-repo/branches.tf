resource "github_branch" "main" {
  repository = github_repository.repository.name
  branch     = "main"
}

resource "github_branch_default" "default" {
  repository = github_repository.repository.name
  branch     = github_branch.main.branch
}

resource "github_branch_protection" "protect_main" {
  depends_on = [github_repository_file.readme]

  repository_id = github_repository.repository.node_id
  pattern       = github_branch.main.branch

  enforce_admins = false

  allows_deletions    = false
  allows_force_pushes = false
  blocks_creations    = true

  require_signed_commits  = true
  required_linear_history = true
  required_status_checks {
    strict = true
  }


  require_conversation_resolution = true
  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    restrict_dismissals        = true
    require_last_push_approval = true
    dismissal_restrictions     = var.org_administrators
    pull_request_bypassers     = var.org_administrators
  }

  push_restrictions    = var.org_administrators
  force_push_bypassers = var.org_administrators
}

output "main_branch" {
  value       = github_branch.main.branch
  description = "The name of the main branch of the repository, to be used when referring to it programatically"
}
