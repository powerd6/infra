# Include configuration from parent folders
include "root" {
  path = find_in_parent_folders()
}

inputs = {
  elephantsql_api_key = get_env("ELEPHANTSQL_APIKEY")
}