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
        member = "development"
        role = "control-plane"
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
    /*
    node42 = {
      cluster = {
        member = "none"
        role = "none"
      }
      lan = [{
        ip  = "xxx"
        mac = "ac:1f:6b:2d:bf:bc"
      }]
      ipmi = {
        ip  = "192.168.10.245"
        mac = "ac:1f:6b:68:2a:b3"
      }
    }
    node43 = {
      cluster = {
        member = "none"
        role = "none"
      }
      lan = [{
        ip  = "xxx"
        mac = "ac:1f:6b:2d:bb:c8"
      }]
      ipmi = {
        ip  = "192.168.10.223"
        mac = "ac:1f:6b:68:2a:9d"
      }
    }
    node44 = {
      cluster = {
        member = "none"
        role = "none"
      }
      lan = [{
        ip  = "ac:1f:6b:2d:ba:1e"
        mac = "xxx"
      }]
      ipmi = {
        ip  = "192.168.10.176"
        mac = "ac:1f:6b:68:2b:aa"
      }
    }
    node45 = {
      cluster = {
        member = "none"
        role = "none"
      }
      lan = [{
        ip  = "xxx"
        mac = "0c:c4:7a:54:9e:6a"
      }]
      ipmi = {
        ip  = "192.168.10.141"
        mac = "ac:1f:6b:68:2a:4b"
      }
    }
    node46 = {
      cluster = {
        member = "none"
        role = "none"
      }
      lan = [{
        ip  = "xxx"
        mac = "ac:1f:6b:83:d3:1a"
      }]
      ipmi = {
        ip  = "192.168.10.231"
        mac = "ac:1f:6b:68:2b:e1"
      }
    }
    node47 = {
      cluster = {
        member = "none"
        role = "none"
      }
      lan = [{
        ip  = "xxx"
        mac = "ac:1f:6b:83:d3:2c"
      }]
      ipmi = {
        ip  = "192.168.10.227"
        mac = "ac:1f:6b:68:2b:dd"
      }
    }
    node48 = {
      cluster = {
        member = "none"
        role = "none"
      }
      lan = [{
        ip  = "xxx"
        mac = "ac:1f:6b:2d:bf:a8"
      }]
      ipmi = {
        ip  = "192.168.10.243"
        mac = "ac:1f:6b:68:2b:ed"
      }
    }
    */
  }
}
