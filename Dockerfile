# Dockerfile
FROM php:8.1-fpm

#RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN apt-get update -y && apt-get install -y libmcrypt-dev
#symfony-cli

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#RUN docker-php-ext-install pdo mbstring

RUN mkdir /opt/currency_api_project
WORKDIR /opt/currency_api_project
COPY . .

RUN composer install
RUN composer require symfony/debug-bundle --dev

#RUN symfony server:ca:install

EXPOSE 8000
CMD php bin/console server:run 0.0.0.0:8000
#RUN symfony server:start -d
#ENTRYPOINT ["/joke-web-server"]
