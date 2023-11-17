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

dependency "repositories" {
  config_path = "${get_repo_root()}/stages/2/repositories"
}


inputs = {
  gh_admin_token = get_env("GH_ADMIN_TOKEN")
  # The following are secrets not required for the module to function.
  # Therefore, they have fallback values to avoid errors.
  elephantsql_api_key = get_env("ELEPHANTSQL_APIKEY", "")
  gandi_key = get_env("GANDI_KEY", "")
  improvmx_api_token = get_env("IMPROVMX_API_TOKEN", "")
  pg_conn_str = get_env("PG_CONN_STR", "")
}