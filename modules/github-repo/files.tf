# Make sure all files are referenced in github_branch_protection.protect_main depends_on

resource "github_repository_file" "readme" {
  repository = github_repository.repository.name
  branch     = github_branch_default.default.branch
  file       = "README.md"
  content = templatefile("${path.module}/files/README.md.tftpl", {
    name        = var.name
    description = var.description
  })
  commit_message      = "Managed by IaC"
  commit_author       = "InfrastructureAsCode"
  commit_email        = "infrastructure@powerd6.org"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      content,
      commit_message,
      commit_author,
      commit_email
    ]
  }
}