module "spec" {
  source             = "../../modules/github-repo"
  name               = "spec"
  description        = "This is the powerd6 specification, and it documents how the project behaves."
  topics             = ["specification", "documentation"]
  pages_cname        = "spec.powerd6.org"
  org_administrators = var.org_administrators
}

resource "gandi_livedns_record" "spec_gh-pages-challenge" {
  name   = "_github-pages-challenge-powerd6.spec"
  ttl    = 10800
  type   = "TXT"
  values = ["\"812e1a3eee1c1521399fa597195914\""]
  zone   = var.domain
}

resource "gandi_livedns_record" "spec_gh-pages-cname" {
  name   = module.spec.name
  ttl    = 10800
  type   = "CNAME"
  values = ["powerd6.github.io."]
  zone   = var.domain
}

resource "github_repository_environment" "spec_github_pages" {
  environment = "github-pages"
  repository  = module.spec.name
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

resource "github_repository_environment_deployment_policy" "spec_github_pages_releases" {
  repository     = module.spec.name
  environment    = github_repository_environment.spec_github_pages.environment
  # TODO: Need to find tag_pattern and fix it
  branch_pattern = "releases/v*"
}