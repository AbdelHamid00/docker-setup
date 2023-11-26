FROM debian:bookworm-backports

RUN apt-get update -y && apt-get install nginx -y \
	&& apt-get install openssl -y

COPY ./conf/default /etc/nginx/sites-enabled/default

COPY ./tools/script.sh /

CMD ["/script.sh"]
