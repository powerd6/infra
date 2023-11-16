data "terraform_remote_state" "domain" {
  backend = "pg"
  config = {
    schema_name = "2-domain"
  }
}

locals {
  destination_email = "hector.zacharias@gmail.com"
}

resource "improvmx_domain" "domain" {
  domain             = data.terraform_remote_state.domain.outputs.domain_name
  notification_email = local.destination_email
}
