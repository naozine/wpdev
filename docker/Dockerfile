FROM wordpress:latest

RUN pecl install xdebug && docker-php-ext-enable xdebug
RUN apt update && apt install -y zip
RUN apt install -y sudo git default-mysql-client subversion
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
         && chmod +x wp-cli.phar \
         && mv wp-cli.phar /usr/local/bin/wp \
         && wp --info

COPY ./php.ini /usr/local/etc/php/php.ini
COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
