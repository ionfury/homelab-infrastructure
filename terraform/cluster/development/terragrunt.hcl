include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:ionfury/homelab-terraform-modules.git//modules/talos-cluster?ref=v0.6.0"
}

inputs = {
  name               = "${basename(get_terragrunt_dir())}"
  endpoint           = "https://192.168.10.246:6443"

  kubernetes_version = "1.30.1"
  talos_version      = "1.8.3"

  kubernetes_config_dir = "~/.kube"
  talos_config_dir      = "~/.talos"
}