# Docker para aplicação Laravel

## Componentes

- NGINX (latest)
- MONGO (latest)
- MYSQL (latest)
- REDIS (latest)
- PHP8.2-FPM (latest)

## Instalação

1. Obtenha o projeto

```
   git clone https://github.com/admsilva/docker-laravel-app.git
   cd docker-laravel-app
   cp .env-example .env
   docker-compose up -d --build
```

2. Se quiser você pode alterar as variáveis de ambiente no arquivo .env:

```
    APP_ENV=dev
    UID=1000
    USER_NAME=www
    GID=1000
    GROUP_NAME=www
    
    NGINX_PORT=8181
    MYSQL_PORT=3308
    
    APP_FOLDER=./src
    LOG_FOLDER=./log
    DOCKER_FILE_FOLDER=./docker
    
    MYSQL_ROOT_PASSWORD=secret
    MYSQL_DATABASE=local_database
    MYSQL_USER=user_database
    MYSQL_PASSWORD=secret
    MYSQL_SERVICE_TAGS=dev
    MYSQL_SERVICE_NAME=mysql
    
    REDIS_PORT=6379
    REDIS_PASSWORD=redis-password
   
    MONGO_USER=user
    MONGO_ROOT_PASSWORD=secret
    MONGO_DATABASE=local_database
    MONGO_PORT=27017
```

## COMANDOS

* Iniciando um projeto/lib com composer
```
   docker-compose run --rm php.dev composer init
```

* Rodar composer install no projeto
```
   docker-compose run --rm php.dev composer install
```

* Rodar composer update no projeto
```
   docker-compose run --rm php.dev composer update
```

### Acesso 

* A aplicação
```
   http://localhost:8181
```

### Mongo

```
   Host: localhost
   Port: 27017
   User: user
   Password: secret
```

### MySQL

```
   Host: localhost
   Port: 3306
   User: homestead
   Password: secret
```

### Redis

```
   Host: localhost
   Port: 6379
   Password: redis-password
```

#### Estrutura de diretórios

```
   ./
   ├──┐
   │  │ 
   │  ├─ docker
   |  |  |
   │  │  └─ mongo
   |  |  |  |
   |  |  |  └─ Dockerfile   
   |  |  |
   │  │  └─ mysql
   |  |  |  |
   |  |  |  └─ Dockerfile
   |  |  |
   │  │  └─ nginx
   |  |  |  |
   |  |  |  └─ config
   |  |  |  |  |
   |  |  |  |  └─ etc
   |  |  |  |     |
   |  |  |  |     └─ nginx
   |  |  |  |        |
   |  |  |  |        └─ config.d
   |  |  |  |        |  |
   |  |  |  |        |  └─ default.conf
   |  |  |  |        |
   |  |  |  |        └─ nginx.conf
   |  |  |  |
   |  |  |  └─ scripts
   |  |  |  |  |
   |  |  |  |  └─ docker-entrypoint.sh
   |  |  |  |
   |  |  |  └─ Dockerfile
   |  |  |
   │  │  └─ php
   |  |  |  |
   |  |  |  └─ config
   |  |  |  |  |
   |  |  |  |  └─ usr
   |  |  |  |     |
   |  |  |  |     └─ local
   |  |  |  |        |
   |  |  |  |        └─ etc
   |  |  |  |           |
   |  |  |  |           └─ php
   |  |  |  |           |  |
   |  |  |  |           |  └─ php.ini-development
   |  |  |  |           |  |
   |  |  |  |           |  └─ php.ini-production
   |  |  |  |           |
   |  |  |  |           └─ php-fpm.d
   |  |  |  |              |
   |  |  |  |              └─ www.conf
   |  |  |  |
   |  |  |  └─ scripts
   |  |  |  |  |
   |  |  |  |  └─ docker-entrypoint.sh
   |  |  |  |
   |  |  |  └─ Dockerfile
   |  |  |
   │  │  └─ redis
   |  |  |  |
   |  |  |  └─ Dockerfile
   |  |  |
   │  ├─ log
   │  │  │
   │  │  └─ access & error log
   │  │
   │  ├─ src
   │  │  │
   │  │  └─ Laravel app folder
   │  │
```

#### DOCKER DICAS

* Parar todos os containers
```sh
  docker kill $(docker ps -q)
```

* Remover todos os containers
```sh
  docker rm $(docker ps -a -q)
```

* Remover todas as imagens
```sh
  docker rmi $(docker images -q)
```

* CLI de acesso ao container
```sh
  docker-compose exec <name|id> /bin/bash
```