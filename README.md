# Homelab-Bootstrap

This repository

## Booting

1. Configure DHCP:
    1. Option 66: The IP of the pxeboot pi defined in `terraform/inventory.hcl`
    2. Option 67: `ipxe-i386.kpxe`
    3. Option 17: [Because of this](https://github.com/pojntfx/ipxe-binaries/blob/d62059cfb48584dc731d75902cbc927855ed3b4d/config/init.ipxe#L4)
1. Boot the machine into PXE/LAN
1. Select the schematic of talos to boot!

