FROM php:8.3-fpm-alpine

ARG APP_ENV
ARG USER
ARG GROUP
ARG APP_FOLDER
ENV APP_ENV $APP_ENV
ENV USER $USER
ENV GROUP $GROUP
ENV APP_FOLDER $APP_FOLDER
ENV COMPOSER_VERSION 2.7.6
ENV LIB_SSH2_VERSION 1.4.1

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
    mpdecimal \
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
    && pecl install -o -f decimal apcu gnupg pdo_sqlsrv timezonedb mongodb ssh2-${LIB_SSH2_VERSION} rdkafka redis pcov \
    && docker-php-ext-install mbstring gd soap xml posix ctype pcntl intl bcmath gmp mysqli pdo pdo_mysql pdo_pgsql zip opcache \
    && docker-php-ext-enable decimal apcu gnupg pdo_sqlsrv timezonedb mongodb ssh2 rdkafka redis pcov \
    && rm -rf /tmp/pear

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$COMPOSER_VERSION \
    && composer --version

RUN if [ -z "`getent group $GROUP`"]; then \
    addgroup -g 1000 -S $GROUP ; \
fi

RUN if [ -z "`getent passwd $USER`"]; then \
    adduser -u 1000 -D -S -G $USER -h /app -g $GROUP $USER ; \
fi

COPY ./docker/php/config/ /
COPY ./docker/php/scripts/ /

RUN if [ "$APP_ENV" == "dev" ] ; then \
    cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini ; \
fi

RUN if [ "$APP_ENV" != "dev" ] ; then \
    cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini ; \
fi

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["sh", "-c", "/docker-entrypoint.sh \"${USER}\" ${GROUP}"]