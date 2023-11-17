terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.42.0"
    }
  }
}

resource "github_repository" "repository" {
  name        = var.name
  description = var.description
  topics      = var.topics

  visibility = "public"

  has_issues      = true
  has_discussions = false
  has_projects    = false
  has_wiki        = false
  has_downloads   = false

  allow_merge_commit          = false
  allow_squash_merge          = true
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
  allow_rebase_merge          = true
  allow_auto_merge            = false
  allow_update_branch         = true
  delete_branch_on_merge      = true

  auto_init          = true
  archive_on_destroy = true

  security_and_analysis {
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }
  vulnerability_alerts                    = true
  ignore_vulnerability_alerts_during_read = true

}
output "repository_url" {
  value       = github_repository.repository.git_clone_url
  description = "The URL of the repository for cloning purposes."
}

output "repository_url_web" {
  value       = github_repository.repository.html_url
  description = "The URL of the repository in the Github webpage."
}

output "name" {
  value       = github_repository.repository.name
  description = "The name of the repository, to be used when referring to it programatically"
}

output "repo_id" {
  value       = github_repository.repository.repo_id
  description = "The ID of the repository, to be used when referring to it programatically"
}
