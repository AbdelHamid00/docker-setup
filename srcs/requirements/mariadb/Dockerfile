FROM debian:bookworm-backports

RUN apt-get update -y && apt-get install mariadb-server -y 


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /

RUN chmod 777 /script.sh

RUN chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT ["/script.sh"]
CMD ["mysqld", "--user=mysql"]
