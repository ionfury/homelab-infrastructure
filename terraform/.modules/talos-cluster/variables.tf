variable "name" {
  description = "A name to provide for the Talos cluster"
  type        = string
  default     = "cluster"
}

variable "endpoint" {
  description = "The endpoint for the Talos cluster"
  type        = string
  default     = "https://cluster.local:6443"
}

variable "kubernetes_version" {
  description = "The version of kubernetes to deploy"
  type        = string
  default     = "1.30.1"
}

variable "talos_version" {
  description = "The version of Talos to use"
  type        = string
  default     = "1.8.3"
}

variable "logging_endpoint" {
  description = "The logging endpoint for Talos to use."
  type = string
  default = null
}

variable "nodes" {
  description = "A map of node data describing the cluster."
  type = map(object({
    machine_type = string
    ip           = string
    install_disk_type = string
    install_disk_size = string
    longhorn     = bool
    nvidia       = bool
    host_dns     = bool
  }))

  default = {
    node1 = {
      machine_type = "controlplane"
      ip           = "10.0.0.1"
      install_disk_type = "ssd"
      install_disk_size = "<= 2TB"
      longhorn     = "false"
      nvidia       = "false"
      host_dns     = "false"
      
    }
  }

  validation {
    condition     = alltrue([for node in var.nodes : node.machine_type == "worker" || node.machine_type == "controlplane"])
    error_message = "The machine_type must be either 'worker' or 'controlplane'."
  }

  validation {
    condition     = alltrue([for node in var.nodes : node.install_disk_type == "ssd" || node.install_disk_type == "hdd"|| node.install_disk_type == "nvme"|| node.install_disk_type == "sd"])
    error_message = "The install_disk_type must be in 'ssd', 'hdd', 'nvme', 'sd'."
  }
}
