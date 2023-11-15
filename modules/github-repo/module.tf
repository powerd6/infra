terraform {
  required_version = ">= 1.6.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.42.0"
    }
  }
}

variable "name" {
  type        = string
  description = "The name of the repository"
}

variable "description" {
  type        = string
  description = "The description of the repository"
}

variable "topics" {
  type        = set(string)
  description = "The list of topics of the repository"
  default     = []
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

resource "github_branch" "main" {
  repository = github_repository.repository.name
  branch     = "main"
}

resource "github_branch_default" "default" {
  repository = github_repository.repository.name
  branch     = github_branch.main.branch
}

resource "github_repository_file" "readme" {
  repository = github_repository.repository.name
  branch     = github_branch_default.default.branch
  file       = "README.md"
  content = templatefile("${path.module}/README.md.tftpl", {
    name        = var.name
    description = var.description
  })
  commit_message      = "Managed by IaC"
  commit_author       = "InfrastructureAsCode"
  commit_email        = "infrastructure@powerd6.org"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      content,
      commit_message,
      commit_author,
      commit_email
    ]
  }
}

output "repository_url" {
  value       = github_repository.repository.git_clone_url
  description = "The URL of the repository for cloning purposes."
}

output "repository_url_web" {
  value       = github_repository.repository.html_url
  description = "The URL of the repository in the Github webpage."
}

output "repo_id" {
  value       = github_repository.repository.repo_id
  description = "The ID of the repository, to be used when referring to it programatically"
}
