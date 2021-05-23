FROM korney4eg/nginx-php:latest

ARG PLUGIN_VERSION 
ENV PLUGIN_URL="https://github.com/korney4eg/thank-after-post-plugin/releases/download/v0.${PLUGIN_VERSION}.0/thank-after-post.zip"
ARG WPCLI_URL="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
ARG WPCORE_URL="https://wordpress.org/latest.tar.gz"

RUN curl ${WPCORE_URL} -o latest.tar.gz && tar xzvf latest.tar.gz

COPY ./app.conf /etc/nginx/sites-enabled/app.conf

COPY ./wp-config.php /var/www/app/wordpress/wp-config.php

RUN chmod -R 777 /var/www/app/wordpress/

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN curl ${WPCLI_URL} -o /var/www/app/wordpress/wp && chmod +x /var/www/app/wordpress/wp

CMD ["/usr/bin/supervisord"]
