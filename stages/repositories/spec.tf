module "spec" {
  source             = "../../modules/github-repo"
  name               = "spec"
  description        = "This is the powerd6 specification, and it documents how the project behaves."
  topics             = ["specification", "documentation"]
  pages_cname        = "https://spec.powerd6.org"
  org_administrators = var.org_administrators
}

# resource "gandi_livedns_record" "gh_pages_a" {
#   name   = "@"
#   ttl    = 3600
#   type   = "A"
#   values = [
#     "185.199.109.153",
#     "185.199.111.153",
#     "185.199.108.153",
#     "185.199.110.153"
#     ]
#   zone   = var.domain
# }
# resource "gandi_livedns_record" "gh_pages_aaaa" {
#   name   = "@"
#   ttl    = 3600
#   type   = "AAAA"
#   values = [
#     "2606:50c0:8000::153",
#     "2606:50c0:8003::153",
#     "2606:50c0:8002::153",
#     "2606:50c0:8001::153"
#     ]
#   zone   = var.domain
# }

resource "gandi_livedns_record" "spec_gh-pages-cname" {
  name   = module.spec.name
  ttl    = 10800
  type   = "CNAME"
  values = ["powerd6.github.io."]
  zone   = var.domain
}