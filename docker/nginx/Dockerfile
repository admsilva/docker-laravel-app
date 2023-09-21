FROM nginx:alpine

ARG USER
ARG GROUP
ENV USER $USER
ENV GROUP $GROUP

RUN if [ -z "`getent group $GROUP`"]; then \
    addgroup -g 1000 -S $GROUP ; \
fi

RUN if [ -z "`getent passwd $USER`"]; then \
    adduser -u 1000 -D -S -G $USER -h /app -g $GROUP $USER ; \
fi

COPY ./docker/nginx/config/ /
COPY ./docker/nginx/scripts/ /

RUN chown -R $USER:$GROUP /var/log/nginx \
  && chown -R $USER:$GROUP /var/cache/nginx \
  && chown -R $USER:$GROUP /etc/nginx \
  && chmod +x /docker-entrypoint.sh

ENTRYPOINT ["sh", "-c", "/docker-entrypoint.sh \"${USER}\" ${GROUP}"]