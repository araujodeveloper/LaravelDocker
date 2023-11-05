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

RUN rm -rf /var/www/html
RUN ln -s public html

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN chmod -R 755 /var/www/storage

RUN npm install

WORKDIR /var/www

EXPOSE 9000