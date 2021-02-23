#!/bin/bash

lvcreate -n window-hdd -L 50G vg0

virt-install \
     --connect qemu:///system \
     --name window \
     --vcpus 2 \
     --ram 2048 \
     --disk path=/dev/vg0/window-hdd \
     --cdrom /vagrant/images/Win10_20H2_v2_Italian_x64.iso \
     --network bridge:br0 \
     --virt-type qemu \
     --graphics vnc,listen=0.0.0.0,port=5901,password=password \
     --os-variant win10 \
     --noautoconsole
