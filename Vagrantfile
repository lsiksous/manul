NUM_NODES = 3
NUM_CONTROLLER_NODE = 1
IP_NTW = "10.0.1."
CONTROLLER_IP_START = 2
NODE_IP_START = 3

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.provision "shell", inline: <<-'SHELL'
    sed -i 's/^#* *\(PermitRootLogin\)\(.*\)$/\1 yes/' /etc/ssh/sshd_config
    sed -i 's/^#* *\(PasswordAuthentication\)\(.*\)$/\1 yes/' /etc/ssh/sshd_config
    systemctl restart sshd.service
    echo -e "vagrant\nvagrant" | (passwd vagrant)
    echo -e "root\nroot" | (passwd root)
    sudo apt update -y
    sudo apt install wget ansible sshpass git
    git clone https://github.com/lsiksous/mapstr.io.git
  SHELL

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
            node.vm.network "public_network", ip: IP_NTW + "#{CONTROLLER_IP_START + i}", bridge: "#$default_network_interface"
         end
    end

    i = 0

    (1..NUM_CONTROLLER_NODE).each do [i] 
        config.vm.define "edge" do |node|
            node.vm.provider "virtualbox" do |vb|
                vb.name = "edge"
                vb.memory = 2048
                vb.cpus = 2
            end
            node.vm.hostname = "edge"
            node.vm.network "public_network", ip: IP_NTW + "#{CONTROLLER_IP_START + i}", bridge: "#$default_network_interface"
        end
    end
end
