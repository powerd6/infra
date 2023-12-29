module "spec" {
  source             = "../../modules/github-repo"
  name               = "spec"
  description        = "This is the powerd6 specification, and it documents how the project behaves."
  topics             = ["specification", "documentation"]
  pages_cname        = "https://spec.powerd6.org"
  org_administrators = var.org_administrators
}

resource "gandi_livedns_record" "spec_gh-pages-cname" {
  name   = module.spec.name
  ttl    = 10800
  type   = "CNAME"
  values = ["powerd6.github.io."]
  zone   = var.domain
}