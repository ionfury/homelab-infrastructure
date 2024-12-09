variable "aws" {
  description = "AWS account information."
  type = object({
    region  = string
    profile = string
  })
}

variable "scripts_dir" {
  description = "Directory containing scripts to be copied to the raspberry pi"
  type        = string
}

variable "schematics_dir" {
  description = "Directory containing schematics to be copied to the raspberry pi"
  type        = string
}

variable "pxeboot_host" {
  description = "Name of the raspberry pi to use as the host for pxebootings"
  type        = string
}

variable "raspberry_pis" {
  description = "Map of raspberry pis with their IP and MAC addresses and ssh credential stores"
  type = map(object({
    ip  = string
    mac = string
    ssh = object({
      user_store = string
      pass_store = string
    })
  }))
}
