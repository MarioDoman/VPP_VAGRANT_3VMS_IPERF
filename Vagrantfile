# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_IMAGE = "bento/ubuntu-20.04"
NODE_COUNT = 2

Vagrant.configure("2") do |config|
  config.vm.define "net2s22c05" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "net2s22c05"
    subconfig.vm.network :private_network, ip: "10.10.2.2"
    subconfig.vm.provision "file", source: "script_net2s22c05.sh", destination: "script_net2s22c05.sh"
    subconfig.vm.provision "file", source: "trex_cfg.yaml", destination: "trex_cfg.yaml"
    subconfig.vm.provision "shell", path: "script_net2s22c05.sh", run: 'always'
    subconfig.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4
    end
    
  end

  config.vm.define "csp2s22c04" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "csp2s22c04"
    subconfig.vm.network :private_network, ip: "10.10.1.2"
    subconfig.vm.provision "file", source: "script_csp2s22c04.sh", destination: "script_csp2s22c04.sh"
    subconfig.vm.provision "file", source: "trex_cfg_copy.yaml", destination: "trex_cfg.yaml"
    subconfig.vm.provision "shell", path: "script_csp2s22c04.sh", run: 'always'
    subconfig.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4
    end
    
  end

  config.vm.define "csp2s22c03" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "csp2s22c03"
    subconfig.vm.network :private_network, ip: "10.10.1.1"
    subconfig.vm.network :private_network, ip: "10.10.2.1"
    subconfig.vm.provision "file", source: "script_csp2s22c03.sh", destination: "script_csp2s22c03.sh"
    subconfig.vm.provision "shell", path: "script_csp2s22c03.sh", run: 'always'
    # subconfig.vm.provision :shell, :inline => "python3 tests_unittest.py -v"
 
  end
end