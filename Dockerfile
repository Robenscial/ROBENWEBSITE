FROM php:8.3.2

WORKDIR /var/www/html
RUN docker-php-ext-install mysqli pdo pdo_mysql
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /usr/bin/wait-for-it
RUN chmod +x /usr/bin/wait-for-it
COPY . .
CMD ["wait-for-it", "database:3306", "--", "php", "-S", "0.0.0.0:80", "-t", "/var/www/html/public" ]