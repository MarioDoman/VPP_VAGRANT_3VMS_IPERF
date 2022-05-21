# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_IMAGE = "ubuntu/focal64"
NODE_COUNT = 2

Vagrant.configure("2") do |config|
  config.vm.define "csp2s22c04" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "csp2s22c04"
    subconfig.vm.network :private_network, ip: "10.10.1.200", virtualbox__intnet: "LAN"
    subconfig.vm.network :private_network, ip: "10.10.2.200", virtualbox__intnet: "LAN"
    subconfig.vm.provision "file", source: "script_csp2s22c04.sh", destination: "script_csp2s22c04.sh"
    subconfig.vm.provision "file", source: "trex_cfg_csp2s22c04.yaml", destination: "trex_cfg.yaml"
    subconfig.vm.provision "shell", path: "script_csp2s22c04.sh", run: 'always'
    subconfig.vm.provision "file", source: "tests_unittest.py", destination: "tests_unittest.py"
    subconfig.vm.provision "file", source: "tests_lib.py", destination: "tests_lib.py"
    subconfig.vm.provision :shell, :inline => "python3 tests_unittest.py -v"
    subconfig.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4
    end
    
  end

  config.vm.define "csp2s22c03" do |subconfig|
    subconfig.vm.box = "bento/ubuntu-20.04"
    subconfig.vm.hostname = "csp2s22c03"
    subconfig.vm.network :private_network, ip: "10.10.1.100", virtualbox__intnet: "LAN"
    subconfig.vm.network :private_network, ip: "10.10.2.100", virtualbox__intnet: "LAN"
    subconfig.vm.provision "file", source: "script_csp2s22c03.sh", destination: "script_csp2s22c03.sh"
    subconfig.vm.provision "file", source: "startup.conf", destination: "startup.conf"
    subconfig.vm.provision "shell", path: "script_csp2s22c03.sh", run: 'always'
 
  end
end