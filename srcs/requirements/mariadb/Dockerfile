FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/config.sh /config.sh

ENTRYPOINT [ "bash", "/config.sh" ]

EXPOSE 3306