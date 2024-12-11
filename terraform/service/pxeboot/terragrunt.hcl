include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:ionfury/homelab-terraform-modules.git//modules/pxe-pi?ref=main"
}

inputs = {
  raspberry_pi = "${basename(get_terragrunt_dir())}"
}