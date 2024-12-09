include "root" {
  path = find_in_parent_folders()
}

locals {
  terragrunt_dir = get_terragrunt_dir()
  schematics_dir = "${local.terragrunt_dir}/resources/schematics"
  scripts_dir    = "${local.terragrunt_dir}/resources/scripts"
}

inputs = {
  schematics_dir = local.schematics_dir
  scripts_dir    = local.scripts_dir
}