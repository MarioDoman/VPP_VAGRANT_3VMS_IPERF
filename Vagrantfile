# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_IMAGE = "bento/ubuntu-18.04"
NODE_COUNT = 2

Vagrant.configure("2") do |config|
  config.vm.define "net2s22c05" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "net2s22c05"
    subconfig.vm.network :private_network, ip: "10.10.2.2"
    subconfig.vm.provision "shell", inline: %(
      sudo apt-get update
      sudo apt install iperf
      iperf -D -s    
      )
  end

  config.vm.define "csp2s22c04" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "csp2s22c04"
    subconfig.vm.network :private_network, ip: "10.10.1.2"
    subconfig.vm.provision "shell", inline: %(
      sudo apt-get update
      sudo apt install iperf
      iperf -D -s   
      )
  end

  config.vm.define "csp2s22c03" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "csp2s22c03"
    subconfig.vm.network :private_network, ip: "10.10.1.1"
    subconfig.vm.network :private_network, ip: "10.10.2.1"
    subconfig.vm.provision "shell", inline:  <<-SCRIPT
      echo "deb \[trusted=yes\] https:\/\/packagecloud.io\/fdio\/release\/ubuntu bionic main" \| sudo tee "/etc/apt/sources.list.d/99fd.io.list"
      sudo curl -L https://packagecloud.io/fdio/release/gpgkey | sudo apt-key add -
      sudo apt-get update
      sudo apt-get --yes install vpp vpp-plugin-core vpp-plugin-dpdk iperf
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
      iperf -D -s
      SCRIPT
  end


  
  # Install on all machines  

  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get install -y avahi-daemon libnss-mdns
  # SHELL

end
# Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "base"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
# end
