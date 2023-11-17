variable "domain" {
  type = string
  description = "The domain in which the aliases should be created"
}

locals {
  destination_email = "hector.zacharias@gmail.com"
}

resource "improvmx_domain" "domain" {
  domain             = var.domain
  notification_email = local.destination_email
}
