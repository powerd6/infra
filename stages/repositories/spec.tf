module "spec" {
  source             = "../../modules/github-repo"
  name               = "spec"
  description        = "This is the powerd6 specification, and it documents how the project behaves."
  topics             = ["specification", "documentation"]
  org_administrators = var.org_administrators
}

moved {
  from = module.specification
  to   = module.spec
}