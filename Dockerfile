FROM korney4eg/nginx-php:latest

ARG version
ARG ver="/plugins/thank-after-post-plugin-v9.php"
ARG WAIT_TOOL="https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait"
ARG wpcliurl="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

RUN curl https://wordpress.org/latest.tar.gz -o latest.tar.gz && tar xzvf latest.tar.gz

COPY ./app.conf /etc/nginx/sites-enabled/app.conf

COPY ./wp-config.php /var/www/app/wordpress/wp-config.php

COPY ${ver} /var/www/app/wordpress/wp-content/plugins/thank-after-post/thank-after-post-plugin.php

RUN chmod -R 777 /var/www/app/wordpress/

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./wp-setup.sh /wp-setup.sh
RUN chmod +x /wp-setup.sh

RUN curl ${wpcliurl} -o /var/www/app/wordpress/wp && chmod +x /var/www/app/wordpress/wp

#ADD ${WAIT_TOOL} /wait
#RUN chmod +x /wait

CMD ["/usr/bin/supervisord"]
