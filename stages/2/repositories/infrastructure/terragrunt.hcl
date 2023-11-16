# Include configuration from parent folders
include "root" {
  path = find_in_parent_folders()
}
include "state" {
  path = find_in_parent_folders("state.hcl")
}

dependency "github" {
  config_path = "${get_repo_root()}/stages/1/github"
}

terraform {
  source = "${get_repo_root()}/modules/github-repo"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
# Configure the GitHub Provider
provider "github" {
  owner = "powerd6" # This stage runs as the powerd6 organization
}
EOF
}

inputs = {
  name = "infrastructure"
  description        = "This repository contains the infrastructure-as-code (IaC) for the powerd6 project."
  topics             = ["infrastructure-as-code"]
  org_administrators = dependency.github.outputs.administators
}