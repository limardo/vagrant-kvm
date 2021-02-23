#!/bin/bash

lvcreate -n debian-hdd -L 5G vg0

virt-install \
     --connect qemu:///system \
     --name debian \
     --vcpus 2 \
     --ram 1024 \
     --disk path=/dev/vg0/debian-hdd \
     --cdrom /vagrant/images/debian-10.8.0-amd64-netinst.iso \
     --network bridge:br0 \
     --virt-type qemu \
     --graphics vnc,listen=0.0.0.0,port=5900,password=password \
     --os-variant debian10 \
     --noautoconsole