# Include configuration from parent folders
include "root" {
  path = find_in_parent_folders()
}
include "state" {
  path = find_in_parent_folders("state.hcl")
}

terraform {
  # Override hook to skip modules when bootstrapping
  before_hook "skip_on_bootstrap" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "This module should run even when IS_BOOTSTRAP=true."]
  }
  # Add hook to migrate to remote when a local state is present (right after a IS_BOOTSTRAP=true run)
  before_hook "create_gh_org" {
    commands     = ["init", "apply", "plan"]
    execute      = ["bash", "${get_terragrunt_dir()}/create_gh_org.sh"]
  }
  before_hook "migrate_to_remote" {
    commands     = ["init", "apply", "plan"]
    execute      = ["bash", "${get_terragrunt_dir()}/migrate_to_remote.sh"]
  }
}