# don't change this line
FROM korney4eg/nginx-php:latest

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir /var/www/wordpress && cd /var/www/wordpress && wp core download --allow-root --locale=en_US 
RUN apt -y update

COPY ./wp-config.php /var/www/wordpress/
COPY ./app.conf /etc/nginx/conf.d/
COPY ./thank-after-post-0.9.0.zip /

RUN chown -R www-data:www-data /var/www/

ENTRYPOINT ["/usr/bin/supervisord"]