resource "github_repository_file" "readme" {
  repository = github_repository.repository.name
  branch     = github_branch_default.default.branch
  file       = "README.md"
  content = templatefile("${path.module}/README.md.tftpl", {
    name        = var.name
    description = var.description
  })
  commit_message      = "Managed by IaC"
  commit_author       = "InfrastructureAsCode"
  commit_email        = "infrastructure@powerd6.org"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      content,
      commit_message,
      commit_author,
      commit_email
    ]
  }
}