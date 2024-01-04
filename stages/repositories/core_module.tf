module "core_module" {
  source             = "../../modules/github-repo"
  name               = "core_module"
  description        = "This is the base powerd6 module, and it contains the basic rules for the system."
  topics             = ["powerd6", "module"]
  org_administrators = var.org_administrators
}