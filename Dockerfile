FROM korney4eg/nginx-php:latest

#ARG version
#ENV version=${version}

RUN curl https://wordpress.org/latest.tar.gz -o latest.tar.gz && tar xzvf latest.tar.gz

COPY ./app.conf /etc/nginx/sites-enabled/app.conf

COPY ./wp-config.php /var/www/app/wordpress/wp-config.php

CMD ["/usr/bin/supervisord"]
