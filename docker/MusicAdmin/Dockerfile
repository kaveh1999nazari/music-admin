FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    libonig-dev \
    libzip-dev \
    libpq-dev \
    libicu-dev \
    && docker-php-ext-install intl pdo pdo_pgsql zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /music-admin

COPY . /music-admin

RUN composer install

RUN chown -R www-data:www-data /music-admin

EXPOSE 8086

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8086"]
