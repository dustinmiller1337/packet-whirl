## Packet

variable "packet_auth_token" {}

variable "packet_project_id" {}

variable "packet_plan" {
 default = "c3.small.x86"
}

variable "packet_facility" {
  default = "sv15"
}

variable "packet_operating_system" {
  default = "ubuntu_20_04"
}

variable "packet_billing_cycle" {
  default = "hourly"
}

variable "packet_user_data" {
  default = ""
}

variable "packet_hosts" {
  default = 1
}

variable "packet_hostname" {}

## Cloudflare

variable "cloudflare_email" {}

variable "cloudflare_api_key" {}

variable "cloudflare_domain" {}
