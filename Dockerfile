# Start from the PHP 8.2 FPM base image
FROM php:8.2-fpm

# Install necessary packages including Nginx and PHP extensions for GD and MySQL
RUN apt-get update && apt-get install -y \
        nginx \
        libfreetype-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libonig-dev \
        libzip-dev \
        libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/sites-enabled/default

# Create the directory for Nginx logs
RUN mkdir -p /var/log/nginx

# Set the working directory
WORKDIR /code

# Expose port 80 for Nginx
EXPOSE 80

# Command to start PHP-FPM and Nginx
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
