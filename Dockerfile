FROM korney4eg/nginx-php:latest

ARG version
ARG WPCLI_URL="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

RUN curl https://wordpress.org/latest.tar.gz -o latest.tar.gz && tar xzvf latest.tar.gz

COPY ./app.conf /etc/nginx/sites-enabled/app.conf

COPY ./wp-config.php /var/www/app/wordpress/wp-config.php

RUN chmod -R 777 /var/www/app/wordpress/

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN curl ${WPCLI_URL} -o /var/www/app/wordpress/wp && chmod +x /var/www/app/wordpress/wp

CMD ["/usr/bin/supervisord"]
