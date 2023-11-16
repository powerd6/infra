dependency "state" {
  config_path = "${get_repo_root()}/stages/0/state"
}

terraform {
  extra_arguments "pg_backend_url" {
    commands = get_terraform_commands_that_need_locking()
    env_vars = {
      PG_CONN_STR = dependency.state.outputs.psql_url
    }
  }
}