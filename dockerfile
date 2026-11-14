FROM serversideup/php:8.2-fpm-nginx

# Copy proyekmu
COPY . /var/www/html
WORKDIR /var/www/html

# Install dependensi Laravel
RUN composer install --no-dev --optimize-autoloader

# Build aset Vite (CSS/JS)
RUN npm install && npm run build

# Atur permission folder
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
