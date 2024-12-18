locals {
  raspberry_pis = {
    pxeboot = {
      lan = {
        ip  = "192.168.10.213"
        mac = "dc:a6:32:00:cd:cc"
      }
      ssh = {
        user_store = "/homelab/raspberry_pi/pxeboot/ssh/user"
        pass_store = "/homelab/raspberry_pi/pxeboot/ssh/password"
      }
    }
  }

  hosts = {
    node41 = {
      cluster = {
        member = "live"
        role = "controlplane"
      }
      disk = {
        install = "/dev/sda"
      }
      lan = [{
        ip  = "192.168.10.253"
        mac = "ac:1f:6b:2d:bf:ee"
      }]
      ipmi = {
        ip  = "192.168.10.221"
        mac = "ac:1f:6b:68:2a:9b"
      }
    }
    node42 = {
      cluster = {
        member = "live"
        role = "controlplane"
      }
      disk = {
        install = "/dev/sda"
      }
      lan = [{
        ip  = "192.168.10.203"
        mac = "ac:1f:6b:2d:bf:bc"
      }]
      ipmi = {
        ip  = "192.168.10.245"
        mac = "ac:1f:6b:68:2a:b3"
      }
    }
    node43 = {
      cluster = {
        member = "live"
        role = "controlplane"
      }
      disk = {
        install = "/dev/sda"
      }
      lan = [{
        ip  = "192.168.10.201"
        mac = "ac:1f:6b:2d:bb:c8"
      }]
      ipmi = {
        ip  = "192.168.10.223"
        mac = "ac:1f:6b:68:2a:9d"
      }
    }
    node44 = {
      cluster = {
        member = "null"
        role = "null"
      }
      disk = {
        install = "/dev/sda"
      }
      lan = [{
        ip  = "192.168.10.218"
        mac = "ac:1f:6b:2d:ba:1e"
      }]
      ipmi = {
        ip  = "192.168.10.176"
        mac = "ac:1f:6b:68:2b:aa"
      }
    }
    node45 = {
      cluster = {
        member = "null"
        role = "null"
      }
      disk = {
        install = "/dev/sda"
      }
      lan = [{
        ip  = "192.168.10.222"
        mac = "ac:1f:6b:2d:bf:ce"
      }]
      ipmi = {
        ip  = "192.168.10.141"
        mac = "ac:1f:6b:68:2a:4b"
      }
    }
    node46 = {
      cluster = {
        member = "cluster"
        role   = "controlplane"
      }
      disk = {
        install = "/dev/sda"
      }
      lan = [{
        ip  = "192.168.10.246"
        mac = "ac:1f:6b:2d:c0:22"
      }]
      ipmi = {
        ip  = "192.168.10.231"
        mac = "ac:1f:6b:68:2b:e1"
      }
    }
  }
}
