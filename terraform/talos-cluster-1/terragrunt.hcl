include "root" {
  path = find_in_parent_folders()
}

inputs = {
  name               = "${basename(get_terragrunt_dir())}"
  endpoint           = "https://192.168.10.254:6443"
  kubernetes_version = "1.30.1"
  talos_version      = "1.8.3"

  nodes = {
    node41 = {
      machine_type = "controlplane"
      ip           = "192.168.10.254"
      install_disk = "/dev/sda"
    }
  }
}