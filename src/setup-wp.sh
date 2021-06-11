#!/bin/bash
sleep 30
wp core install --url=localhost:9000 --title=DockerWP --admin_user=admin --admin_password=$WP_PW --admin_email=admin@mail.com --path=$WP_PATH --allow-root

sleep 1
if [ $TAG -eq 1 ]
then
    wp plugin install /plugins/$WP_PLUGIN --activate --allow-root --path=$WP_PATH
elif [ $TAG -eq 2 ]
then
    wp plugin install /plugins/$WP_PLUGIN2 --activate --allow-root --path=$WP_PATH    
fi

sleep 1
wp theme install $WP_THEME --activate --path=$WP_PATH --allow-root
