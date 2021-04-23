FROM debian:buster

RUN apt-get update && apt-get -y install \
    nginx \
    curl \
    openssl \
    php-fpm \
    wget \
    mariadb-server \
    php-mysql \
    php-mbstring \
    vim

COPY    ./src/test.sh ./
COPY	./src/default ./
COPY	./src/wp-config.php var/www/html/wordpress/
COPY	./src/sql.sh ./
COPY	./src/config.inc.php ./

EXPOSE 80 443

CMD bash run.sh
