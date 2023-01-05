FROM php:8.2-fpm-alpine

ARG USER
ARG GROUP
ARG CONFIG_FOLDER
ENV USER $USER
ENV GROUP $GROUP
ENV COMPOSER_VERSION 2.5.1
ENV LIB_SSH2_VERSION 1.3.1

RUN apk --update add --no-cache --no-progress \
    ${PHPIZE_DEPS} \
    libpng-dev \
    openssl-dev \
    gd \
    libxml2-dev \
    git \
    freetype \
    freetype-dev \
    oniguruma-dev \
    mpdecimal-dev \
    php-phpdbg \
    busybox \
    apk-tools \
    bash \
    supervisor \
    nano \
    tar \
    openssl \
    openssh \
    curl \
    librdkafka-dev \
    tzdata \
    libpng \
    libjpeg-turbo \
    libpng \
    libpng-dev \
    libxml2-dev \
    icu \
    icu-dev \
    gpgme-dev \
    gpgme \
    libssh2-dev \
    autoconf \
    build-base \
    gmp-dev \
    gmp \
    gpg \
    gnupg \
    zip \
    unzip \
    libzip-dev \
    libmcrypt-dev \
    unixodbc \
    unixodbc-dev \
    libpq \
    libpq-dev \
    && rm -rf /var/cache/apk/*

RUN pecl channel-update pecl.php.net \
    && pecl install -o -f decimal apcu gnupg pdo_sqlsrv timezonedb mongodb ssh2-${LIB_SSH2_VERSION} rdkafka redis \
    && docker-php-ext-install mbstring gd soap xml posix ctype pcntl intl bcmath gmp mysqli pdo pdo_mysql pdo_pgsql zip opcache \
    && docker-php-ext-enable decimal apcu gnupg pdo_sqlsrv timezonedb mongodb ssh2 rdkafka redis \
    && rm -rf /tmp/pear

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$COMPOSER_VERSION \
    && composer --version

RUN if [ -z "`getent group $GROUP`"]; then \
    addgroup -g 1000 -S $GROUP ; \
fi

RUN if [ -z "`getent passwd $USER`"]; then \
    adduser -u 1000 -D -S -G $USER -h /app -g $GROUP $USER ; \
fi

RUN mkdir -p /app \
    && chown -R $USER:$GROUP /app \
    && chmod -R 775 /app

COPY ./docker/php/config/ /