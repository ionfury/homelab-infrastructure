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
/*
resource "unifi_user" "hosts" {
  for_each = var.hosts

  name     = each.key
  mac      = each.value.mac
  fixed_ip = each.value.ip
  note     = local.note
}
*/
