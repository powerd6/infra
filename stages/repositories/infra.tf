module "infra" {
  source             = "../../modules/github-repo"
  name               = "infra"
  description        = "This repository contains the infrastructure-as-code (IaC) for the powerd6 project."
  topics             = ["infrastructure-as-code"]
  org_administrators = var.org_administrators
}

moved {
  from = module.infrastructure
  to   = module.infra
}

resource "github_repository_environment" "infra_live" {
  environment = "live"
  repository  = module.infra.name
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

resource "github_repository_environment_deployment_policy" "infra_live_main" {
  repository     = module.infra.name
  environment    = github_repository_environment.infra_live.environment
  branch_pattern = module.infra.main_branch
}