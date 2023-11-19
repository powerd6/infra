module "tools" {
  source             = "../../modules/github-repo"
  name               = "tools"
  description        = "A collection of tools to work with powerd6 artifacts."
  topics             = ["tools", "cli"]
  org_administrators = var.org_administrators
}