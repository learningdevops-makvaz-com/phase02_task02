#!/bin/bash
sleep 30
wp core install --url=localhost:9000 --title=DockerWP --admin_user=admin --admin_password=$WP_PW --admin_email=admin@mail.com --path=/var/www/wordpress --allow-root
sleep 5
wp plugin install /plugins/$WP_PLUGIN --activate --allow-root --path=/var/www/wordpress