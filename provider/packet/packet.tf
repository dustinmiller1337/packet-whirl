variable "auth_token" {}

variable "hostname" {}

variable "project_id" {}

variable "facility" {}

variable "operating_system" {}

variable "billing_cycle" {}

variable "plan" {}

variable "hosts" {}

variable "user_data" {}

provider "packet" {
  auth_token = var.auth_token
}

resource "packet_device" "host" {
  count            = var.hosts
  hostname         = var.hostname
  plan             = var.plan
  facilities       = var.facility
  operating_system = var.operating_system
  billing_cycle    = var.billing_cycle
  project_id       = var.project_id
  user_data        = var.user_data

  connection {
    user    = "root"
    type    = "ssh"
    timeout = "2m"
    host    = self.access_public_ipv4
  }

  provisioner "local-exec" {
    command = "sleep 20 ; ANSIBLE_FORCE_COLOR=1 ansible-playbook -u root -i '${self.access_public_ipv4},' playbook.yml"
  }
}

output "public_ipv4" {
  value = packet_device.host.*.access_public_ipv4
}

output "public_ipv6" {
  value = packet_device.host.*.access_public_ipv6
}
