
sudo add-apt-repository ppa:ondrej/php

sudo apt-get update

sudo apt-get install php7.0 php5.6 php5.6-mysql php-gettext php5.6-mbstring php-xdebug libapache2-mod-php5.6 libapache2-mod-php7.0
sudo a2dismod php7.0
sudo a2enmod php5.6
sudo service apache2 restart
