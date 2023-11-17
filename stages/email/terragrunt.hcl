# Include configuration from parent folders
include "root" {
  path = find_in_parent_folders()
}
include "state" {
  path = find_in_parent_folders("state.hcl")
}

dependency "domain" {
  config_path = "${get_repo_root()}/stages/domain"

  mock_outputs = {
    domain_name = "powerd6.org"
  }
}


inputs = {
  gandi_key         = get_env("GANDI_KEY")
  improvm_api_token = get_env("IMPROVMX_API_TOKEN")
  domain            = dependency.domain.outputs.domain_name
}