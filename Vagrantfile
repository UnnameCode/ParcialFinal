Vagrant.configure("2") do |config|
config.vm.define :clienteFw do |clienteFw|
clienteFw.vm.box = "bento/centos-7"
clienteFw.vm.network :private_network, ip: "192.168.100.4"
clienteFw.vm.provission "shell", path: "script2.sh"
clienteFw.vm.hostname = "clienteFw"
end
config.vm.define :firewall do |firewall|
firewall.vm.box = "bento/centos-7"
firewall.vm.network :private_network, ip: "209.191.50.3"
firewall.vm.network :private_network, ip: "192.168.50.3"
firewall.vm.provision "shell", path: "script.sh"
firewall.vm.hostname = "firewall"
end
config.vm.define :servidor2 do |servidor2|
servidor2.vm.box = "bento/centos-7"
servidor2.vm.network :forwarded_port, guest:443, host:5568
servidor2.vm.network :private_network, ip: "192.168.50.4"
servidor2.vm.hostname = "servidor2"
end
end