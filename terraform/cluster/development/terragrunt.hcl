include "root" {
  path = find_in_parent_folders()
}

include "config" {
  path   = "${get_terragrunt_dir()}/../config.hcl"
  expose = true
}

terraform {
  source = "${include.config.locals.source_base_url}?ref=v0.6.0"
}

inputs = {
  name               = "${basename(get_terragrunt_dir())}"
  endpoint           = "https://192.168.10.246:6443"
}