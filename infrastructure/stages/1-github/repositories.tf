module "infrastructure" {
  source = "../../modules/github-repo"
  name        = "infrastructure"
  description = "This repository contains the infrastructure-as-code (IaC) for the powerd6 project."
  topics = ["infrastructure-as-code"]
}