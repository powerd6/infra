module "specification" {
  source             = "../../modules/github-repo"
  name               = "spec"
  description        = "This is the powerd6 specification, and it documents how the project behaves."
  topics             = ["specification", "documentation"]
  org_administrators = var.org_administrators
}

resource "github_repository_environment" "spec_preview" {
  environment = "preview"
  repository  = module.specification.name
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }
}

resource "github_repository_environment" "spec_release" {
  environment = "release"
  repository  = module.specification.name
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

resource "github_repository_environment_deployment_policy" "spec_release_main" {
  repository     = module.specification.name
  environment    = github_repository_environment.infra_live.environment
  branch_pattern = module.specification.main_branch
}