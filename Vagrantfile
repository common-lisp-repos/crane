# -*- mode: ruby -*-

ROOT = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_"
SUFFIX = "_chef-provisionerless.box"

BOXES = {
  "debian" => "7.4",
  "centos" => "6.5",
  "ubuntu" => "14.04",
  "freebsd" => "10.0"
}

def url(box_name)
  return ROOT + box_name + SUFFIX
end

Vagrant.configure("2") do |config|
  config.vm.network :private_network, ip: "192.168.58.100"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Machines

  BOXES.each_pair do |name, version|
    config.vm.define name do |m|
      fullname = name + '-' + version
      m.vm.box = fullname
      m.vm.box_url = url(fullname)
    end
  end

  # Virtual hardware
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
end