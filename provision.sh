#!/bin/bash
sudo apt-get update
sudo apt-get install php7.0-common php-fpm php-mysql nginx
sudo ufw allow 'Nginx HTTP'
sudo tee /etc/php/7.0/fpm/php.ini<<EOF
cgi.fix_pathinfo=0
EOF
sudo systemctl restart php7.0-fpm
sudo cp config/default /etc/nginx/sites-available/default
sudo nginx -t
sudo systemctl reload nginx
sudo service php7.0-fpm restart
sudo apt-get install mysql-server
sudo mysql_secure_installation
sudo service nginx restart

#Installing Docker
# sudo apt-get update
# sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
# sudo apt-get install -y apt-transport-https ca-certificates
# sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# sudo tee /etc/apt/sources.list.d/docker.list <<EOF
# deb https://apt.dockerproject.org/repo ubuntu-xenial main
# EOF
# sudo apt-get update
# sudo apt-get purge lxc-docker
# apt-cache policy docker-engine
# sudo apt-get install -y docker-engine curl python-pip
#
# sudo curl -L -s https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
# docker-compose -version
# sudo service docker start
#
# #Add the User group
# sudo usermod -aG docker vagrant
