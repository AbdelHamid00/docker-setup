FROM debian:bookworm-backports

WORKDIR /var/www/wordpress

RUN apt-get update -y
RUN apt-get install php8.2 php8.2-fpm -y \
                     php8.2-mysql\
                    php8.2-cli \
                     curl\
                     vim \
                     mariadb-client

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d

RUN mkdir -p /var/www
RUN curl -o /var/www/latest.tar.gz https://wordpress.org/latest.tar.gz
RUN cd /var/www && tar -xf latest.tar.gz && rm -rf latest.tar.gz

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp && chmod +x /usr/bin/wp

COPY ./tools/script.sh /
RUN chmod +x /script.sh
RUN mkdir -p /run/php

ENTRYPOINT ["/script.sh"]
