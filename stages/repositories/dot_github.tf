module "dot_github" {
  source             = "../../modules/github-repo"
  name               = ".github"
  description        = "This repository contains the github-specific things, like actions, workflows, and profiles"
  topics             = ["actions", "workflows", "profile"]
  org_administrators = var.org_administrators
}