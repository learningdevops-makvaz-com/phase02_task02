FROM korney4eg/nginx-php:latest

#ARG version
#ENV version=${version}

#COPY index.php /var/www/html
RUN curl https://wordpress.org/latest.tar.gz -o latest.tar.gz && tar xzvf latest.tar.gz

COPY ./default /etc/nginx/sites-enabled/app.conf

COPY ./wp-config.php /var/www/app/wordpress/wp-config.php

CMD ["/usr/bin/supervisord"]
