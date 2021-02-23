#!/bin/bash

apt-get install bridge-utils -y -qq

cat > /etc/network/interfaces <<- EOM
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet manual

auto br0
iface br0 inet dhcp
        bridge_ports eth0
EOM

service networking restart

cat > /etc/libvirt/bridged.xml <<- EOM
<network>
  <name>br0</name>
  <forward mode="bridge"/>
  <bridge name="br0"/>
</network>
EOM

virsh net-define --file /etc/libvirt/bridged.xml
virsh net-autostart br0
virsh net-start br0
