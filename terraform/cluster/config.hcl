locals {
  kubernetes_version    = "1.30.1"
  kubernetes_config_dir = "~/.kube"

  talos_version    = "1.8.3"
  talos_config_dir = "~/.talos"

  source_base_url = "git@github.com:ionfury/homelab-terraform-modules.git//modules/talos-cluster"
}