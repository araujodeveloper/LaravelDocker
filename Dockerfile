FROM php:8.2-fpm as php

RUN apt-get update \
  && apt-get install -y \
  git \
  curl \
  libpng-dev \
  libonig-dev \
  libxml2-dev \
  zip \
  unzip \
  zlib1g-dev \
  libpq-dev \
  libzip-dev \
  nodejs \
  npm

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
  && docker-php-ext-install pdo pdo_pgsql pgsql zip bcmath gd

WORKDIR /var/www

RUN rm -rf /var/www/html
RUN ln -s public html

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . /var/www

RUN chmod -R 777 /var/www/storage

RUN chown -R www-data:www-data /var/www

RUN usermod -u 1000 www-data
USER www-data

RUN npm install


EXPOSE 9000
ENTRYPOINT [ "php-fpm" ]
