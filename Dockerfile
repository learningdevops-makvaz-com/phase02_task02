FROM korney4eg/nginx-php:latest

ARG version
ARG PLUGIN_URL="https://github.com/korney4eg/thank-after-post-plugin/releases/download/v0.9.0/thank-after-post.zip"
ARG wpcliurl="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

RUN curl https://wordpress.org/latest.tar.gz -o latest.tar.gz && tar xzvf latest.tar.gz

COPY ./app.conf /etc/nginx/sites-enabled/app.conf

COPY ./wp-config.php /var/www/app/wordpress/wp-config.php

#COPY ${ver} /var/www/app/wordpress/wp-content/plugins/thank-after-post/thank-after-post-plugin.php
RUN curl ${PLUGIN_URL} -o /var/www/app/wordpress/thank-after-post.zip

RUN chmod -R 777 /var/www/app/wordpress/

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN curl ${wpcliurl} -o /var/www/app/wordpress/wp && chmod +x /var/www/app/wordpress/wp

CMD ["/usr/bin/supervisord"]
