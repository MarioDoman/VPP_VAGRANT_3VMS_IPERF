#!/bin/bash

if [ $USER != "root" ] ; then
    echo "Restarting script with sudo..."
    sudo $0 ${*}
    exit
fi

# start trex on net2s22c04
sudo apt-get update
sudo apt -y install git python3 wget python3-distutils pciutils iproute2 make net-tools
sudo apt install -y linux-headers-`uname -r` build-essential
sudo wget --no-cache https://trex-tgn.cisco.com/trex/release/latest --no-check-certificate
sudo tar -xzvf latest
sudo cp  trex_cfg.yaml /etc/trex_cfg.yaml
sudo mkdir logs