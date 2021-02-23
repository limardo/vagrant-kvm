#!/bin/bash

echo "set grub-pc/install_devices /dev/sda" | debconf-communicate

apt-get update -qq
apt-get upgrade -y -qq
