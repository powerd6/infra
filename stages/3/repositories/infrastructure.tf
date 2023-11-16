module "infrastructure" {
  source             = "../../modules/github-repo"
  name               = "infrastructure"
  description        = "This repository contains the infrastructure-as-code (IaC) for the powerd6 project."
  topics             = ["infrastructure-as-code"]
  org_administrators = data.terraform_remote_state.github.outputs.administators
}

resource "github_actions_organization_secret_repositories" "org_secret_repos" {
  secret_name             = "existing_secret_name"
  selected_repository_ids = [data.github_repository.repo.repo_id]
}

resource "github_actions_organization_secret_repositories" "elephantsql_api_key" {
  secret_name             = "ELEPHANTSQL_API_KEY"
  selected_repository_ids = module.infrastructure.repo_id
}
resource "github_actions_organization_secret_repositories" "pg_conn_str" {
  secret_name             = "PG_CONN_STR"
  selected_repository_ids = module.infrastructure.repo_id
}
resource "github_actions_organization_secret_repositories" "gh_org_admin" {
  secret_name             = "GH_ORG_ADMIN"
  selected_repository_ids = module.infrastructure.repo_id
}
resource "github_actions_organization_secret_repositories" "gandi_key" {
  secret_name             = "GANDI_KEY"
  selected_repository_ids = module.infrastructure.repo_id
}
resource "github_actions_organization_secret_repositories" "improvmx_api_token" {
  secret_name             = "IMPROVMX_API_TOKEN"
  selected_repository_ids = module.infrastructure.repo_id
}