FROM php:8-apache-buster

# Install base PHP extensions
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions bcmath gd

# Enable Apache 2 rewrite module
RUN a2enmod rewrite

# Install Chamber utility for managing AWS SSM Parameters
COPY --from=segment/chamber:2 /chamber /usr/local/bin/
RUN chmod +x /usr/local/bin/chamber

WORKDIR /var/www/html
