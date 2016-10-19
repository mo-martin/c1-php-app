# #!/bin/bash

Installing Docker
sudo apt-get update
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo tee /etc/apt/sources.list.d/docker.list <<EOF
deb https://apt.dockerproject.org/repo ubuntu-xenial main
EOF
sudo apt-get update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine
sudo apt-get install -y docker-engine curl python-pip

sudo curl -L -s https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -version

#Add the User group
sudo usermod -aG docker ubuntu

sudo add-apt-repository ppa:ondrej/php

sudo apt-get update

sudo apt-get install php7.0 php5.6 php5.6-mysql php-gettext php5.6-mbstring php-xdebug libapache2-mod-php5.6 libapache2-mod-php7.0
sudo a2dismod php7.0
sudo a2enmod php5.6
sudo service apache2 restart
