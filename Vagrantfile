# -*- mode: ruby -*-
# vi: set ft=ruby :

# Adjustable settings
CFG_MEMSIZE = ENV['GITLAB_MEMORY'] || 2048
CFG_CPU = ENV['GITLAB_CPUS'] || 2
CFG_PORT = ENV['GITLAB_PORT'] || 443
CFG_SWAP = ENV['GITLAB_SWAP'] || 0
CFG_HOST = ENV['GITLAB_HOST'] || "gitlab"
CFG_IP_HOSTS = "127.0.0.1 localhost localhost.local\n 192.168.98.100  gitlab gitlab\n"


VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :gitlab do |config|
    # Configure some hostname here
    config.vm.hostname = CFG_HOST
    config.vm.box = "ubuntu/xenial64"
    config.vm.network :private_network, ip: "192.168.98.100"
    config.vm.provision "shell", inline: "echo '#{CFG_IP_HOSTS}' > /etc/hosts"
    config.vm.provision :shell, :path => "install-gitlab.sh", env: { "GITLAB_SWAP" => CFG_SWAP, "GITLAB_PORT" => CFG_PORT }
    config.vm.network :forwarded_port, guest: 443, host: CFG_PORT
  end

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", CFG_MEMSIZE]
    v.customize ["modifyvm", :id, "--cpus"  , CFG_CPU ]
  end
end
