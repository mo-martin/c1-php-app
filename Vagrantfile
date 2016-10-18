Vagrant.configure("2") do |config|

  config.vm.define "php" do |php|
    php.vm.box = "bento/ubuntu-16.04"
    php.vm.synced_folder "../c1-php", "/home/vagrant/c1-php/"
    php.vm.network "forwarded_port", guest: 80, host: 1111
    php.vm.synced_folder "files/", "/var/www/html/"
    # docker.vm.provision "shell", path: "shell/dockeronly.sh"
  end
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.name = "php"
  end
end
