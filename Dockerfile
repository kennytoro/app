
FROM php:7.4-cli 

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y \
    unzip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install

EXPOSE 50

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=50"]
