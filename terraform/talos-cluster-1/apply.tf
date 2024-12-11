resource "talos_machine_configuration_apply" "nodes" {
  client_configuration        = talos_machine_secrets.this.client_configuration
  machine_configuration_input = data.talos_machine_configuration.control_plane.machine_configuration
  for_each                    = var.nodes
  node                        = each.key
  endpoint                    = each.value.ip

  config_patches = [
    templatefile("${path.module}/templates/install-disk-and-hostname.yaml.tmpl", {
      hostname     = each.key
      install_disk = each.value.install_disk
    }),
    each.value.machine_type == "controlplane" ? file("${path.module}/files/cp-scheduling.yaml") : null
  ]
}

resource "talos_machine_bootstrap" "this" {
  depends_on = [talos_machine_configuration_apply.nodes]

  client_configuration = talos_machine_secrets.this.client_configuration
  node                 = [for node_key, node in var.nodes : node_key if node.machine_type == "controlplane"][0]
  endpoint             = [for node_key, node in var.nodes : node.ip if node.machine_type == "controlplane"][0]
}

resource "talos_cluster_kubeconfig" "this" {
  depends_on           = [talos_machine_bootstrap.this]
  client_configuration = talos_machine_secrets.this.client_configuration
  node                 = [for node_key, node in var.nodes : node_key if node.machine_type == "controlplane"][0]
  endpoint             = [for node_key, node in var.nodes : node.ip if node.machine_type == "controlplane"][0]
  #wait                 = true
}
