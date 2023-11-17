module "infrastructure" {
  source             = "../../modules/github-repo"
  name               = "infra"
  description        = "This repository contains the infrastructure-as-code (IaC) for the powerd6 project."
  topics             = ["infrastructure-as-code"]
  org_administrators = var.org_administrators
}

resource "github_repository_environment" "infra_live" {
  environment  = "live"
  repository   = module.infrastructure.outputs.name
  deployment_branch_policy {
    protected_branches          = true
    custom_branch_policies = true
  }
}

resource "github_repository_environment_deployment_policy" "infra_live_main" {
  repository        = module.infrastructure.outputs.name
  environment       = github_repository_environment.infra_live.environment
  branch_pattern = module.infrastructure.outputs.main_branch
}