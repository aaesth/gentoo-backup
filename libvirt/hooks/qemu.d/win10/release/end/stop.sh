#!/bin/bash
set -x

# this doesnt work idk

modprobe -r vfio-pci

virsh nodedev-reattach pci_0000_01_00_0
virsh nodedev-reattach pci_0000_01_00_1

rc-service ly start
