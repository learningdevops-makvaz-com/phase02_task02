FROM korney4eg/nginx-php:latest

ARG version
ENV version=${version}

#COPY index.php /var/www/html
COPY app.conf /etc/nginx/sites-enabled/app.conf

CMD ["/usr/bin/supervisord"]
