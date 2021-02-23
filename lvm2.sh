#!/bin/bash

apt-get install lvm2 -y -qq

pvcreate /dev/sdb

vgcreate vg0 /dev/sdb

