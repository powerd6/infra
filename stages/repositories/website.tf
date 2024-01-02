module "website" {
  source             = "../../modules/github-repo"
  name               = "website"
  description        = "The landing page for the powerd6 project."
  topics             = ["website"]
  pages_cname        = "powerd6.org"
  org_administrators = var.org_administrators
}
resource "gandi_livedns_record" "website_gh-pages-challenge" {
  name   = "_github-pages-challenge-powerd6.${module.website.name}"
  ttl    = 10800
  type   = "TXT"
  values = ["\"TODO\""]
  zone   = var.domain
}

resource "gandi_livedns_record" "website_gh-pages-cname" {
  name   = "@"
  ttl    = 10800
  type   = "CNAME"
  values = ["powerd6.github.io."]
  zone   = var.domain
}

resource "github_repository_environment" "website_github_pages" {
  environment = "github-pages"
  repository  = module.website.name
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

resource "github_repository_environment_deployment_policy" "website_github_pages_releases" {
  repository     = module.website.name
  environment    = github_repository_environment.website.environment
  # TODO: Fix to allow tag 'v*' when https://github.com/integrations/terraform-provider-github/issues/1974 is merged
  branch_pattern = "releases/v*"
}