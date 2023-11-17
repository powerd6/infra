# Include configuration from parent folders
include "root" {
  path = find_in_parent_folders()
}
include "state" {
  path = find_in_parent_folders("state.hcl")
}

inputs = {
  gandi_key = get_env("GANDI_KEY")
}