FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    php \
    php-fpm \
    php7.4-fpm \
    php-mysqli \
    php-redis \
    php-curl \
    php-xml \
    php-mbstring \
    wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /workspace /run/php && chown -R www-data:www-data /workspace /run/php

WORKDIR /workspace

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/setup.sh .

RUN chmod +x setup.sh

CMD ["./setup.sh"]