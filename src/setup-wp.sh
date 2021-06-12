#!/bin/bash
sleep 30
wp core install --url=$URL --title=$WP_TITLE --admin_user=$WP_ADM --admin_password=$WP_PW --admin_email=$ADM_EMAIL --path=$WP_PATH --allow-root

sleep 1
wp plugin install $WP_PLUGIN --activate --allow-root --path=$WP_PATH
sleep 1
wp theme install $WP_THEME --activate --path=$WP_PATH --allow-root
