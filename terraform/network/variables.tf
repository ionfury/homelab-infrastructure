variable "aws" {
  description = "AWS account information."
  type = object({
    region  = string
    profile = string
  })
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

variable "hosts" {
  description = "Map of hosts with their cluster, LAN, and IPMI details"
  type = map(object({
    cluster = object({
      member = string
      role   = string
    })
    lan = list(object({
      ip  = string
      mac = string
    }))
    ipmi = object({
      ip  = string
      mac = string
    })
  }))
}

variable "unifi" {
  type = object({
    address        = string
    username_store = string
    password_store = string
  })
}
