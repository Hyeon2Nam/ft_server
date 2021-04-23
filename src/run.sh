#!/bin/bash

# nginx 여기서 fail뜨는거 수정하기
service nginx start
service nginx status

#openssl
openssl req -x509 -newkey rsa:4096 -nodes -subj '/CN=localhost' -keyout localhost.dev.key -out localhost.dev.crt -days 365
mv localhost.dev.crt etc/ssl/certs/
mv localhost.dev.key etc/ssl/private/
chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key
mv default ./etc/nginx/sites-available/default
service nginx restart

# php-fpm
mv /var/www/html/* ./
service nginx restart
service php7.3-fpm start

#wordpress
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ var/www/html/
chown -R www-data:www-data /var/www/html/wordpress

#mysql
service mysql start 
mysql < sql.sh
service php7.3-fpm restart

# phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv phpmyadmin /var/www/html/
mv config.inc.php var/www/html/phpmyadmin/
service nginx restart
service mysql start
mysql < var/www/html/phpmyadmin/sql/create_tables.sql

bash
