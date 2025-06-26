#!/bin/bash

if [ ! -f /usr/local/bin/wp ]; then
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

chown -R www-data:www-data /var/www/html

cd /var/www/html

if [ ! -f wp-config.php ]; then
    echo "Installation de WordPress..."
    su www-data -s /bin/bash -c "
        wp core download --allow-root --path=/var/www/html;
        wp core config --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --path=/var/www/html;
        wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path=/var/www/html;
        wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --path=/var/www/html;
    "
else
    echo "WordPress semble déjà installé."
fi

exec php-fpm7.4 -R -F -d error_log=/dev/stderr
