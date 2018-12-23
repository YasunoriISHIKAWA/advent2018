FROM php:7.3.0-fpm

RUN apt-get update \
  && apt-get install --no-install-recommends -y libpq-dev \
  && docker-php-ext-install \
    pdo \
    pdo_pgsql \
    pgsql \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ADD ./php.ini /usr/local/etc/php/php.ini
ADD ./php-fpm.conf /usr/local/etc/php-fpm.conf
ADD ./php-fpm.d/ /usr/local/etc/php-fpm.d

RUN sed -i "s/;date.timezone =/date.timezone = Asia\/Tokyo/" /usr/local/etc/php/php.ini

ENV COMPOSER_VERSION 1.8.0

RUN curl --silent --fail --location --retry 3 --output /tmp/installer.php --url https://getcomposer.org/installer \
  && php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
  && composer --ansi --version --no-interaction \
  && rm -rf /tmp/*

ADD app/ /app

RUN apt-get update \
  && apt-get install --no-install-recommends -y git \
  && cd /app \
  && composer install --no-plugins --no-scripts \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
