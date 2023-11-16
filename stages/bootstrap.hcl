terraform {
  # Override hook to skip modules when bootstrapping
  before_hook "skip_on_bootstrap" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "This module should run even when IS_BOOTSTRAP=true."]
  }
}