locals {
  zone_id = lookup(data.cloudflare_zones.domain_zones.zones[0], "id")
}

variable "api_key" {}

variable "domain" {}

variable "email" {}

variable "public_ipv4" {}

variable "public_ipv6" {}

provider "cloudflare" {
  email   = var.email
  api_key = var.api_key
}

data "cloudflare_zones" "domain_zones" {
  filter {
    name   = var.domain
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "ipv4" {
  zone_id = local.zone_id
  name    = var.domain
  value   = element(var.public_ipv4, 0)
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "ipv6" {
  zone_id = local.zone_id
  name    = var.domain
  value   = element(var.public_ipv6, 0)
  type    = "AAAA"
  proxied = false
}

resource "cloudflare_record" "wildcard" {
  depends_on = [cloudflare_record.ipv4]

  zone_id = local.zone_id
  name    = "*"
  value   = var.domain
  type    = "CNAME"
  proxied = false
}
