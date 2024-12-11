locals {

  unifi = {
    address        = "https://192.168.1.1"
    username_store = "/homelab/unifi/terraform/username"
    password_store = "/homelab/unifi/terraform/password"
  }

  networks = {
    citadel = {
      name       = "citadel"
      vlan       = 10
      cidr       = "192.168.10.0/24"
      gateway    = "192.168.10.1"
      netmask    = "255.255.255.0"
      dhcp_cidr  = "192.168.10.10/24"
      dhcp_start = 10
      dhcp_stop  = 254
      site       = "default"
    }
  }
}