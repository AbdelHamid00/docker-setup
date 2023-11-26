#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/nginx.key -out /etc/ssl/nginx.crt -sha256 -subj "/CN=MA"

nginx -g "daemon off;"
