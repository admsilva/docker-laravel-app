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

RUN mkdir -p /app \
    && chown -R $USER:$GROUP /app \
    && chmod -R 775 /app

COPY ./docker/nginx/config/ /