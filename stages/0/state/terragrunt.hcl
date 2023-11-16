# Include configuration from parent folders
include "root" {
  path = find_in_parent_folders()
}
# Allows module to run when bootstrapping
include "bootstrap" {
  path = find_in_parent_folders("bootstrap.hcl")
}

inputs = {
  elephantsql_api_key = get_env("ELEPHANTSQL_APIKEY", "")
}