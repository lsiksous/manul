# configure_environment.rb

# Use Ubuntu 20.04 LTS (Focal Fossa) as the base box
VAGRANT_BOX_IMAGE="ubuntu/bionic64"
VAGRANT_PROVISION_PATH="tools/provision.sh"
NUM_NODES = 3
NUM_CONTROLLER_NODE = 1
IP_NTW = "10.0.1."
CONTROLLER_IP_START = 2
NODE_IP_START = 3

def configure_environment(config)
  config.vm.box = VAGRANT_BOX_IMAGE
  config.vm.provision "shell", path: VAGRANT_PROVISION_PATH
  
  (1..NUM_NODES).each do |i|
    config.vm.define "node0#{i}" do |node|
      node.vm.provider "virtualbox" do |vb|
        vb.name = "node0#{i}"
        vb.memory = 16000
        vb.cpus = 6
      end
      node.vm.disk :disk, size: "100GB", primary: true
      node.vm.disk :disk, size: "20GB", name: "disk1"
      node.vm.disk :disk, size: "20GB", name: "disk2"
      node.vm.hostname = "node0#{i}"
      node.vm.network "public_network", ip: IP_NTW + "#{NODE_IP_START + i}", bridge: "#$default_network_interface"
    end
  end

  (1..NUM_CONTROLLER_NODE).each do |i|
    config.vm.define "edge" do |node|
      node.vm.provider "virtualbox" do |vb|
        vb.name = "edge"
        vb.memory = 4096
        vb.cpus = 4
      end
      node.vm.hostname = "edge"
      node.vm.network "public_network", ip: IP_NTW + "#{CONTROLLER_IP_START + i}", bridge: "#$default_network_interface"
    end
  end
end
