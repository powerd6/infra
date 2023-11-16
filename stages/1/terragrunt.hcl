# Include configuration from parent folders
include "root" {
  path = find_in_parent_folders()
}

# Depend on previous stage
dependencies {
  paths = [
    "../0/state",
  ]
}