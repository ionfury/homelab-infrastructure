include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:ionfury/homelab-terraform-modules.git//modules/unifi-users?ref=v0.1.0"
}

locals {
  inventory_vars = read_terragrunt_config(find_in_parent_folders("inventory.hcl"))

  raspberry_pis = local.inventory_vars.locals.raspberry_pis
  hosts = local.inventory_vars.locals.hosts


  merged_list = flatten(concat(
    [
      for pi_name, pi_details in local.raspberry_pis : [
        {
          name = pi_name
          ip   = pi_details.lan.ip
          mac  = pi_details.lan.mac
        }
      ]
    ],
    [
      for host_name, host_details in local.hosts : concat(
        [
          for idx, lan in host_details.lan : {
            name = "${host_name}_lan_${idx}"
            ip   = lan.ip
            mac  = lan.mac
          }
        ],
        [
          {
            name = "${host_name}_ipmi"
            ip   = host_details.ipmi.ip
            mac  = host_details.ipmi.mac
          }
        ]
      )
    ]
  ))

  merged_map = { for item in local.merged_list : item.name => { ip = item.ip, mac = item.mac } }
}

inputs = {
  unifi_users = local.merged_map
}