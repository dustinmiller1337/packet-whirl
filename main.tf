module "provider" {
  source = "./provider/packet"

  auth_token       = var.packet_auth_token
  project_id       = var.packet_project_id
  billing_cycle    = var.packet_billing_cycle
  facility         = [var.packet_facility]
  plan             = var.packet_plan
  operating_system = var.packet_operating_system
  hosts            = var.packet_hosts
  hostname         = var.packet_hostname
  user_data        = var.packet_user_data
}

module "dns" {
  source = "./provider/cloudflare"

  email       = var.cloudflare_email
  api_key     = var.cloudflare_api_key
  domain      = var.cloudflare_domain
  public_ipv4 = module.provider.public_ipv4
  public_ipv6 = module.provider.public_ipv6
}
