#!/bin/bash

sudo apt-get update
curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | sudo bash
sudo apt-get update
sudo apt-get -y install vpp vpp-plugin-core vpp-plugin-dpdk iperf apt-transport-https ca-certificates curl software-properties-common net-tools
sudo ifconfig eth1 down
sudo ifconfig eth2 down
sudo cp startup.conf /etc/vpp/startup.conf
sudo service vpp restart
sleep 10
sudo vppctl set int ip address GigabitEthernet0/8/0 10.10.1.100/24
sudo vppctl set interface state GigabitEthernet0/8/0 up
sudo vppctl set int ip address GigabitEthernet0/9/0 10.10.2.100/24
sudo vppctl set interface state GigabitEthernet0/9/0 up
sudo vppctl ip route add 16.0.0.0/8 via 10.10.2.200
sudo vppctl ip route add 16.0.0.0/8 via 10.10.1.200
sudo vppctl ip route add 48.0.0.0/8 via 10.10.1.200
sudo vppctl ip route add 48.0.0.0/8 via 10.10.2.200


