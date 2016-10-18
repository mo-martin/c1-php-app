#!/bin/bash
eval "$(docker-machine env default)"

set +e
docker stop php-app php-db
docker rm php-app php-db

find php-app/files/* -type d -not -name '.gitignore' -print0 | xargs -0 rm -rf --
set -e

rm -rf /tmp/php-app/files
# rm -rf /tmp/php-db/db
mkdir -p /tmp/php-app/files
# mkdir -p /tmp/php-db/db

cp -r ~/c1-php/files/. /tmp/php-app/files/
# rm -rf /tmp/php-app/app/.git
# rm -rf /tmp/php-app/app/.gitignore

cp -r /tmp/php-app/files/. ./php-app/files/



pushd php-app
docker build --tag php-app:latest .
popd
pushd php-db
docker build --tag php-db:latest .
popd
pushd php-data
docker build --tag php-data:latest .
popd


echo "Checking for the container php-data"
set +e
docker ps -a |grep php-data > /dev/null
FOUND_DATA=$?
echo $FOUND_DATA
set -e

if [[ "$FOUND_DATA" == "0" ]]; then
  echo "PHP data store already exists"
else
  echo "Running the new container"
  docker create --name php-data php-data:latest
fi

#
# echo "Running the rest"
# docker run -it --link php-db:mysql --rm mysql/mysql-server:5.5 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
docker run --name php-db -e MYSQL_ROOT_PASSWORD=123456abc -d php-db:latest
docker run --name php-app --link php-db -d php-app



#docker ps -a
# docker run --name moses-db -p 27017:27017 --volumes-from my-mongo -d my-node-db:latest
# docker run --name moses-app -p 3000:3000 -e API_URL=http://192.168.99.101:3001 -d my-node-app:latest
# docker ps -a
