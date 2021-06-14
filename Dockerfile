# don't change this line
FROM korney4eg/nginx-php:latest

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

RUN chmod +x /usr/local/bin/wp && mkdir /var/www/wordpress && cd /var/www/wordpress && wp core download --allow-root --locale=en_US 

COPY ./src/wp-config.php /var/www/wordpress/
COPY ./src/app.conf /etc/nginx/conf.d/
COPY ./src/setup-wp.sh /src/setup-wp.sh
COPY ./supervisord/setup.conf /etc/supervisor/conf.d/

RUN chmod +x /src/setup-wp.sh && chown -R www-data:www-data /var/www/

# Set wp plugin env var in dockerfile as it is dependent on the version of docker image you are running 
ENV WP_PLUGIN=https://github.com/korney4eg/thank-after-post-plugin/releases/download/v0.9.0/thank-after-post.zip

WORKDIR /var/www/wordpress

ENTRYPOINT ["/usr/bin/supervisord"]