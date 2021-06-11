#!/bin/bash

docker swarm init
while true
do
 read -r -p "GenerateSecrets [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
openssl rand -base64 20 | docker secret create mysql_password -
openssl rand -base64 20 | docker secret create mysql_root_password -
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done

docker stack up -c ./docker-compose.yml webStack