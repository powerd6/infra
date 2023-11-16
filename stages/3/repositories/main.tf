data "terraform_remote_state" "github" {
  backend = "pg"
  config = {
    schema_name = "1-github"
  }
}