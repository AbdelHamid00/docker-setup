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
COPY ./tools/script.sh /

RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]
