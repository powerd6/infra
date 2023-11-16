locals {
  labels = [
    {
      name : "goal: addition",
      description : "Addition of a new feature",
      color : "ffffff",
    },
    {
      name : "goal: improvement",
      description : "Improvement to an existing feature",
      color : "ffffff",
    },
    {
      name : "goal: fix",
      description : "Bug fix",
      color : "ffffff",
    },
    {
      name : "good first issue",
      description : "New-contributor friendly",
      color : "7f0799",
    },
    {
      name : "help wanted",
      description : "Open to participation from the community",
      color : "7f0799",
    },
    {
      name : "priority: high",
      description : "Stalls work on the project or its dependents",
      color : "ff9f1c",
    },
    {
      name : "priority: medium",
      description : "Not blocking but should be fixed soon",
      color : "ffcc00",
    },
    {
      name : "priority: low",
      description : "Low priority and doesn't need to be rushed",
      color : "cfda2c",
    },
  ]
}

resource "github_issue_label" "standard_issue_labels" {
  for_each    = { for idx, label in local.labels : idx => label }
  repository  = github_repository.repository.name
  name        = each.value["name"]
  description = each.value["description"]
  color       = each.value["color"]
}
