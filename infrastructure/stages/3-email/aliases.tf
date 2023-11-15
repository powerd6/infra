

resource "improvmx_email_forward" "catch_all" {
  domain            = data.terraform_remote_state.domain.outputs.domain_name
  alias_name        = "*"
  destination_email = local.destination_email
  depends_on        = [improvmx_domain.domain]
}

resource "improvmx_email_forward" "contact" {
  domain            = data.terraform_remote_state.domain.outputs.domain_name
  alias_name        = "contact"
  destination_email = local.destination_email
  depends_on        = [improvmx_domain.domain]
}

resource "improvmx_email_forward" "billing" {
  domain            = data.terraform_remote_state.domain.outputs.domain_name
  alias_name        = "billing"
  destination_email = local.destination_email
  depends_on        = [improvmx_domain.domain]
}

output "email_aliases" {
  value       = [improvmx_email_forward.catch_all, improvmx_email_forward.contact, improvmx_email_forward.billing]
  description = "A list of the email aliases configurations"
}
