locals {
  network_vars = read_terragrunt_config(find_in_parent_folders("network.hcl"))
  inventory_vars = read_terragrunt_config(find_in_parent_folders("inventory.hcl"))
  cloud_vars = read_terragrunt_config(find_in_parent_folders("cloud.hcl"))
}

inputs = merge(
  local.network_vars.locals,
  local.inventory_vars.locals,
  local.cloud_vars.locals,
)

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "homelab-terragrunt-remote-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terragrunt"
    profile        = "terragrunt"
  }
}