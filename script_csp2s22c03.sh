#!/bin/bash

if [ $USER != "root" ] ; then
    echo "Restarting script with sudo..."
    sudo $0 ${*}
    exit
fi


sudo apt-get update
curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | sudo bash
sudo apt-get update
sudo apt-get -y install vpp vpp-plugin-core vpp-plugin-dpdk iperf apt-transport-https ca-certificates curl software-properties-common net-tools
sudo ifconfig eth1 down
sudo ifconfig eth2 down
sudo sed -i 's/# dpdk/dpdk/' /etc/vpp/startup.conf
sudo sed -i 's/# dev 0000:02:00.0/dev 0000:00:08.0/' /etc/vpp/startup.conf
sudo sed -i '/dev 0000:00:08.0/a \        dev 0000:00:09.0' /etc/vpp/startup.conf 
sudo service vpp restart
sleep 10
sudo vppctl set int ip address GigabitEthernet0/8/0 10.10.1.1/24
sudo vppctl set interface state GigabitEthernet0/8/0 up
sudo vppctl set int ip address GigabitEthernet0/9/0 10.10.2.1/24
sudo vppctl set interface state GigabitEthernet0/9/0 up
