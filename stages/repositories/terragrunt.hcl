# Include configuration from parent folders
include "root" {
  path = find_in_parent_folders()
}
include "state" {
  path = find_in_parent_folders("state.hcl")
}

dependency "github" {
  config_path = "${get_repo_root()}/stages/github"
}


inputs = {
  gh_admin_token = get_env("GH_ADMIN_TOKEN")
  org_administrators = dependency.github.outputs.administators
}