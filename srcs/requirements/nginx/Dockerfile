FROM debian:bookworm-backports

RUN apt-get update -y && apt-get install nginx -y \
	&& apt-get install openssl -y

#RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
	#-keyout /etc/ssl/nginx.key \
	#-out /etc/ssl/nginx.crt -sha256 -subj "/CN=MA"

#COPY ./conf/default /etc/nginx/sites-enabled/default

COPY ./tools/script.sh /
CMD ["/script.sh"]
