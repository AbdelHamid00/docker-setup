#!/bin/bash

sleep 5

chown -R www-data:www-data /var/www/wordpress

rm -f /var/www/wordpress/wp-config.php

wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST

chmod +x wp-config.php 

wp core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL
create_user() {
    if wp user list --allow-root | grep -q $WP_USER; then
        return
    fi

    wp user create $WP_USER $WP_USER_MAIL \
        --role=author --user_pass=$WP_USER_PASSWORD \
        --allow-root

    if [ $? -eq 0 ]; then
        echo "user created"
    else
        echo "can't create user"
    fi
}

create_user

/usr/sbin/php-fpm8.2 -F
