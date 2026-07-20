#!/bin/bash
# kill everything
killall Hyprland
pkill hyprland
pkill Hyprland
killall Xwayland
pkill Xwayland
#rc-service ly stop # or sddm/gdm

# idk what this does gemini told me to put it here
fuser -k /dev/nvidia*
fuser -k /dev/dri/*

# kms
rc-service elogind stop

echo 0 > /sys/class/vtconsole/vtcon0/bind

modprobe -r nvidia_drm
modprobe -r nvidia_modeset
modprobe -r nvidia_uvm
modprobe -r nvidia

virsh nodedev-detach pci_0000_01_00_0
virsh nodedev-detach pci_0000_01_00_1
virsh nodedev-detach pci_0000_00_14_0

modprobe vfio-pci
