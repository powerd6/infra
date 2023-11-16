# Include configuration from parent folders
include "root" {
  path = find_in_parent_folders()
}

inputs = {
  elephantsql_api_key = get_env("ELEPHANTSQL_APIKEY")
}

terraform {
  # Override hook to skip modules when bootstrapping
  before_hook "skip_on_bootstrap" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "This module should run even when IS_BOOTSTRAP=true."]
  }
  # Add hook to migrate to remote when a local state is present (right after a IS_BOOTSTRAP=true run)
  before_hook "migrate_to_remote" {
    commands     = ["init", "apply", "plan"]
    execute      = ["bash", "${get_terragrunt_dir()}/migrate_to_remote.sh"]
  }
}