terraform {
  backend "pg" {
  }
  required_providers {
    gandi = {
      source  = "go-gandi/gandi"
      version = "2.2.4"
    }
  }
}

provider "gandi" {
  # Configuration options
}

resource "gandi_domain" "powerd6_org" {
  name = "powerd6.org"
  owner {
    type        = "person"
    given_name  = "Hector"
    family_name = "Castelli Zacharias"
    phone       = "+34.677059383"
    street_addr = "Rua Canido 57"
    zip         = "15113"
    country     = "ES"
    state       = "ES-C"

    email = "hector.zacharias@gmail.com"
    city  = "Malpica de Bergantiños"

    data_obfuscated = true
    mail_obfuscated = true
  }

  autorenew = true

  lifecycle {
    # This is needed because the API does not support updating the owner,
    # and even when the values are the same, it tries to.
    ignore_changes = [owner]
  }
}

output "domain_name" {
  value = gandi_domain.powerd6_org.name
}

resource "gandi_nameservers" "ns" {
  domain = gandi_domain.powerd6_org.name

  nameservers = [
    "ns-168-a.gandi.net",
    "ns-138-b.gandi.net",
    "ns-19-c.gandi.net",
  ]
}

output "domain_ns" {
  value = gandi_nameservers.ns.nameservers
}
