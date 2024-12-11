

resource "random_string" "random" {
  length  = 6
  special = false
}

resource "local_file" "kubeconfig" {
  content  = talos_cluster_kubeconfig.this.kubeconfig_raw
  filename = pathexpand("~/.kube/kubeconfig-${var.name}-${random_string.random.result}")

  file_permission = "0644"
}


resource "local_file" "talosconfig" {
  content  = data.talos_client_configuration.this.talos_config
  filename = pathexpand("~/.kube/talosconfig-${var.name}-${random_string.random.result}")

  file_permission = "0644"
}