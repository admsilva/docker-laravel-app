# Docker para aplicação Laravel

## Componentes

- NGINX (latest)
- MYSQL (latest)
- PHP8.2-FPM (latest)

## Instalação

1. Obtenha o projeto

    ```
    git clone https://github.com/admsilva/docker-laravel-app.git
    cd docker-laravel-app
    cp .env-example .env
    mkdir ./src/public
    touch ./src/public/index.php
    echo "<?php phpinfo();" >> ./src/public/index.php
    docker-compose up -d --build
    ```

2. Se quiser você pode alterar as variáveis de ambiente no arquivo .env:

    ```
    UID=1000
    USER=www-data
    GID=1000
    GROUP=www-data
    
    NGINX_PORT=8080
    MYSQL_PORT=3306
    NPM_PORT=3000
    
    APP_FOLDER=./src
    DATABASE_FOLDER=./data
    LOG_FOLDER=./log
    DOCKER_FILE_FOLDER=./docker
    
    MYSQL_ROOT_PASSWORD=secret
    MYSQL_DATABASE=homestead
    MYSQL_USER=homestead
    MYSQL_PASSWORD=secret
    SERVICE_TAGS=dev
    SERVICE_NAME=mysql
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
http://localhost:8080
```

### MySQL

```
Host: locahost
Port: 3306
User: homestead
Password: secret
```

#### Estrutura de diretórios

```
./
├──┐
│  │ 
│  ├─ data
│  │  │
│  │  └─ database
│  │ 
│  ├─ docker
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
|  |  |  |           └─ php-fpm.d
|  |  |  |              |
|  |  |  |              └─ www.conf
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