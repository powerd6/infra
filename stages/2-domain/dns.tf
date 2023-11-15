resource "gandi_livedns_record" "improvmx_mx" {
  name   = "@"
  ttl    = 10800
  type   = "MX"
  values = ["10 mx1.improvmx.com.", "20 mx2.improvmx.com."]
  zone   = gandi_domain.powerd6_org.name
}
resource "gandi_livedns_record" "improvmx_txt" {
  name   = "@"
  ttl    = 10800
  type   = "TXT"
  values = ["v=spf1 include:spf.improvmx.com ~all"]
  zone   = gandi_domain.powerd6_org.name
}