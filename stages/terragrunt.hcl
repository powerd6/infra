terraform_binary = "tofu"
terraform_version_constraint = ">= 1.6.0"
terragrunt_version_constraint = ">= 0.53.0"

inputs = {
}

locals {
  # Change this to true to run first-time setup commands
  is_bootstrap = get_env("IS_BOOTSTRAP", false)
  # Set the stage backend to something similar to `stage-0-state` based on folder structure
  backend_config = {
    # Used only for first-time setup. Requires migration to remote state.
    bootstrap = {
      type = "local"
      config = {}
    }
    # Used normally.
    remote = {
      type = "pg"
      config = {
        schema_name = replace("stages/${path_relative_to_include()}", "/", "-")
        conn_str = get_env("PG_CONN_STR", false)
      }
    }
  }
}
remote_state {
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  backend = local.is_bootstrap == "true" ? local.backend_config.bootstrap.type : local.backend_config.remote.type
  config = local.is_bootstrap == "true" ? local.backend_config.bootstrap.config : local.backend_config.remote.config
}

terraform {
  # Set the lock timeout for all commands that support it
  extra_arguments "retry_lock" {
    commands  = get_terraform_commands_that_need_locking()
    arguments = ["-lock-timeout=20m"]
  }
  # Set hook to skip modules when bootstrapping
  before_hook "skip_on_bootstrap" {
    commands     = ["apply", "plan"]
    execute      = ["bash", find_in_parent_folders("skip_on_bootstrap.sh")]
  }
  after_hook "migrate_to_remote" {
    commands     = ["init", "apply", "plan"]
    execute      = local.is_bootstrap == "true" ? [
      "bash",
      "${get_repo_root()}/stages/check_local.sh", 
      "${get_terragrunt_dir()}/migrate.sh"
    ] : ["echo", "No migration needed. Not bootstrapping."]
  }
}
