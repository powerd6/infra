module "infrastructure" {
  source             = "../../modules/github-repo"
  name               = "infra"
  description        = "This repository contains the infrastructure-as-code (IaC) for the powerd6 project."
  topics             = ["infrastructure-as-code"]
  org_administrators = var.org_administrators
}