#!/bin/bash

apt-get install -y -qq htop nano

apt-get autoremove -y -qq
apt-get clean -qq
apt-get autoclean -qq