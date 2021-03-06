# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
# Update apt and get dependencies
sudo apt-get update
sudo apt-get install -y unzip curl wget vim

# Download Nomad
echo Fetching Nomad...

NOMAD_VERSION=0.12.1
cd /tmp/
curl -sSL https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -o nomad.zip
echo Installing Nomad...
unzip nomad.zip
rm -f nomad.zip
sudo chmod +x nomad
sudo mv nomad /usr/bin/nomad
sudo mkdir -p /etc/nomad.d
sudo chmod a+w /etc/nomad.d

# Install Consul
echo Fetching Consul...
cd /tmp/
CONSUL_VERSION=1.7.2
curl -sSL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip > consul.zip
echo Installing Consul...
unzip consul.zip
rm -f consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul
sudo mkdir /etc/consul.d
sudo chmod a+w /etc/consul.d

cd /vagrant/
chmod +x ./server*.sh
SCRIPT

Vagrant.configure(2) do |config|

    # Basic configuration
    config.vm.box = "bento/ubuntu-18.04"

    # Provisioners
    config.vm.provision "shell", inline: $script
    config.vm.provision "docker"

    # Servers
    1.upto(3) do |i|
        vmName = "nomad-server#{i}"
        vmIP = "192.168.50.1#{i}"
        vmNomadPort = "2000#{i}"
        vmConsulPort = "2100#{i}"
        config.vm.define vmName do |server|
            #server.vm.box = "ubuntu/trusty64"
            server.vm.hostname = vmName
            server.vm.network "private_network", ip: vmIP
            server.vm.network "forwarded_port", guest: 4646, host: vmNomadPort, auto_correct: true
            server.vm.network "forwarded_port", guest: 8500, host: vmConsulPort, auto_correct: true
        end
    end

    # Increase memory for Virtualbox
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
    end

    # Increase memory for Parallels Desktop
    config.vm.provider "parallels" do |p, o|
        p.memory = "1024"
    end

    # Increase memory for VMware
    ["vmware_fusion", "vmware_workstation"].each do |p|
        config.vm.provider p do |v|
            v.vmx["memsize"] = "1024"
        end
    end
end
