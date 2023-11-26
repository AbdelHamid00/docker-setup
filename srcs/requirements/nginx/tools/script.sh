#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/nginx.key -out /etc/ssl/nginx.crt -sha256 -subj "/CN=MA"

echo 'server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name aabouzid.42.fr;

    ssl_certificate /etc/ssl/nginx.crt;
    ssl_certificate_key /etc/ssl/nginx.key;

    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/wordpress;

    location ~ [^/]\.php(/|$) { 
            try_files  = 404;
            fastcgi_pass  wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}' > /etc/nginx/sites-available/default

nginx -g "daemon off;"
