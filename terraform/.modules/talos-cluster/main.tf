resource "talos_machine_secrets" "this" {}

data "talos_machine_configuration" "control_plane" {
  cluster_name       = var.name
  cluster_endpoint   = var.endpoint
  kubernetes_version = var.kubernetes_version
  talos_version      = var.talos_version
  machine_type       = "controlplane"
  machine_secrets    = talos_machine_secrets.this.machine_secrets
}

data "talos_machine_configuration" "worker" {
  cluster_name       = var.name
  cluster_endpoint   = var.endpoint
  kubernetes_version = var.kubernetes_version
  talos_version      = var.talos_version
  machine_type       = "worker"
  machine_secrets    = talos_machine_secrets.this.machine_secrets
}

data "talos_client_configuration" "this" {
  cluster_name         = var.name
  client_configuration = talos_machine_secrets.this.client_configuration
  endpoints            = [for node_key, node in var.nodes : node.ip if node.machine_type == "controlplane"]
}

resource "talos_machine_configuration_apply" "nodes" {
  client_configuration        = talos_machine_secrets.this.client_configuration
  machine_configuration_input = data.talos_machine_configuration.control_plane.machine_configuration
  for_each                    = var.nodes
  node                        = each.key
  endpoint                    = each.value.ip

  config_patches = [
    templatefile("${path.module}/templates/install_disk.yaml.tmpl", {
      type = each.value.install_disk_type
      size = each.value.install_disk_size
    }),
    templatefile("${path.module}/templates/hostname.yaml.tmpl", {
      hostname     = each.key
    }),
    templatefile("${path.module}/templates/logging.yaml.tmpl", {
      logging_endpoint     = var.logging_endpoint
    }),
    each.value.machine_type == "controlplane" ? file("${path.module}/files/cp-scheduling.yaml") : null,
    each.value.longhorn == true ? file("${path.module}/files/longhorn.yaml") : null,
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
