terraform {
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

  visibility = "public"

  has_issues      = true
  has_discussions = false
  has_projects    = false
  has_wiki        = false
  has_downloads   = false

  allow_merge_commit  = false
  allow_squash_merge  = true
  allow_rebase_merge  = true
  allow_auto_merge    = false
  allow_update_branch = true

  auto_init          = false
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


output "repository_url" {
    value = github_repository.repository.git_clone_url
}

output "repository_url_web" {
    value = github_repository.repository.html_url  
}