FROM debian:buster

RUN apt-get update -y && apt-get install nginx openssl -y

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

RUN mkdir -p /etc/nginx/ssl /var/run/nginx && \
	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=qujacob.42.fr/UID=qujacob"

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
