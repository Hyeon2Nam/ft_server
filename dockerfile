FROM debian:buster

RUN apt-get update && apt-get -y install \
    nginx \
    openssl \
    php-fpm \
    wget \
    mariadb-server \
    php-mysql \
    php-mbstring \
    vim

COPY    ./srcs/run.sh ./
COPY	./srcs/default ./
COPY	./srcs/wp-config.php var/www/html/wordpress/
COPY	./srcs/sql.sh ./
COPY	./srcs/config.inc.php ./

EXPOSE 80 443

CMD bash run.sh
