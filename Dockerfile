# don't change this line
FROM korney4eg/nginx-php:latest

# your code goes here
# Make nginx use app.conf configuration to properly render php files
# Make sure that index.php file is available in browser
# expose needed ports


# don't change this line
CMD ["/usr/bin/supervisord"]
