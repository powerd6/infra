resource "github_organization_project" "ideas" {
  name = "Module ideas"
  body = <<EOF
    This is a dumping ground for module ideas that could be implemented by maintainers.
    
    If something is interesting to you, feel free to create it and share with the team.
    
    Contributions are appreciated!
    EOF
}

resource "github_project_column" "ideas_new" {
  project_id = github_organization_project.ideas.id
  name       = "🎉 New"
}

resource "github_project_column" "ideas_wip" {
  project_id = github_organization_project.ideas.id
  name       = "🏭 In-progress"
}

resource "github_project_column" "ideas_done" {
  project_id = github_organization_project.ideas.id
  name       = "🚀 Done!"
}