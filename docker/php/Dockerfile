FROM php:7.4-fpm

ARG USER
ARG GROUP
ARG CONFIG_FOLDER

ADD $CONFIG_FOLDER/php-fpm/www.conf /usr/local/etc/php-fpm.d/
ADD $CONFIG_FOLDER/cron.d/crontab /etc/cron.d/crontab

RUN apt-get update && \
      apt-get install -y cron && \
      apt-get install -y git && \
      apt-get install -y curl && \
      apt-get install -y libpng-dev && \
      apt-get install -y libonig-dev && \
      apt-get install -y libxml2-dev && \
      apt-get install -y zip && \
      apt-get install -y unzip && \
      apt-get install -y zlib1g-dev && \
      apt-get install -y libzip-dev && \
      apt-get install -y sendmail && \
      apt-get install -y mailutils && \
      apt-get install -y libmcrypt-dev && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/* && \
      echo "sendmail_from='notificacao@reithor.com.br'" >> /usr/local/etc/php/conf.d/sendmail.ini  && \
      echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini  && \
      docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd zip && \
      sed -i '/#!\/bin\/sh/aservice sendmail restart' /usr/local/bin/docker-php-entrypoint && \
      sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint && \
      mkdir -p /var/www/html && \
      useradd -ms /bin/bash $USER && \
      gpasswd -a $USER root && \
      chown -R $USER:$GROUP /var/www/html && \
      chmod -R 775 /var/www/html && \
      chmod 0644 /etc/cron.d/crontab && \
      crontab /etc/cron.d/crontab && \
      touch /var/log/cron.log && \
      mkdir -p /home/$USER/.composer && \
      chown -R $USER:$USER /home/$USER && \
      cd /home/$USER && \
      curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
