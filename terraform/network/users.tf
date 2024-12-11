locals {
  note = "Managed by Terraform"
}

resource "unifi_user" "raspberry_pis" {
  for_each = var.raspberry_pis

  name     = each.key
  mac      = each.value.mac
  fixed_ip = each.value.ip
  note     = local.note
}

resource "unifi_user" "host_lan" {
  for_each = merge([
    for host, details in var.hosts : {
      for index, lan in details.lan :
      "${host}_lan_${index}" => lan
    }
  ]...)

  name     = each.key
  mac      = each.value.mac
  fixed_ip = each.value.ip
  note     = local.note
}

resource "unifi_user" "host_ipmi" {
  for_each = var.hosts

  name     = "${each.key}-ipmi"
  mac      = each.value.ipmi.mac
  fixed_ip = each.value.ipmi.ip
  note     = local.note
}
