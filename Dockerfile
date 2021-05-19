FROM korney4eg/nginx-php:latest

ARG version
#ENV version=${version}
ARG ver="/plugins/thank-after-post-plugin-${version}.php"

RUN curl https://wordpress.org/latest.tar.gz -o latest.tar.gz && tar xzvf latest.tar.gz

COPY ./app.conf /etc/nginx/sites-enabled/app.conf

COPY ./wp-config.php /var/www/app/wordpress/wp-config.php

COPY ${ver} /var/www/app/wordpress/wp-content/plugins/thank-after-post/thank-after-post-plugin.php

RUN chmod -R 777 /var/www/app/wordpress/

CMD ["/usr/bin/supervisord"]
