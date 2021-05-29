# don't change this line
FROM korney4eg/nginx-php:latest

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir /var/www/wordpress && cd /var/www/wordpress && wp core download --allow-root --locale=en_US 
RUN apt -y update

COPY ./src/wp-config.php /var/www/wordpress/
COPY ./src/app.conf /etc/nginx/conf.d/
COPY ./plugins/ /plugins/
COPY ./src /src/
COPY ./supervisord/setup.conf /etc/supervisor/conf.d/

RUN chmod +x /src/setup-wp.sh
RUN chown -R www-data:www-data /var/www/

WORKDIR /var/www/wordpress

ENTRYPOINT ["/usr/bin/supervisord"]