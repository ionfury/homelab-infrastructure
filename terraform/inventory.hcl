locals {
  pxeboot_host = "pxeboot"

  raspberry_pis = {
    pxeboot = {
      ip   = "192.168.10.213"
      mac  = "dc:a6:32:00:cd:cc"
      ssh = {
        user_store = "/homelab/raspberry_pi/pxeboot/ssh/user"
        pass_store = "/homelab/raspberry_pi/pxeboot/ssh/password"
      }
    }
  }

  hosts = {
    node1 = {
      ip   = "192.168.10.214"
      mac  = "dc:a6:32:00:cd:cd"
    }
    # Add more hosts as needed
  }
}
