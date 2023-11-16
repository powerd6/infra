resource "github_branch" "main" {
  repository = github_repository.repository.name
  branch     = "main"
}

resource "github_branch_default" "default" {
  repository = github_repository.repository.name
  branch     = github_branch.main.branch
}

resource "github_branch_protection" "protect_main" {
  repository_id = github_repository.repository.node_id
  pattern       = github_branch.main.branch

  enforce_admins = true

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
    dismissal_restrictions     = var.org_administrators
    require_last_push_approval = true
  }

  required_status_checks {
    strict = true
  }

  push_restrictions    = var.org_administrators
  force_push_bypassers = var.org_administrators
}
