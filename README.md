# docker-dev-env-php-fpm-82

A simple docker compose container with Nginx, PHP 8.4 (cli + fpm), Node.js 20.x, Mariadb 10, PhpMyAdmin, Symfony 7

## How to use 

- Create a .env file based on .env.sample and adjust it to your needs.
- Run "docker compose build" to build your php cli/fpm environment
- Run "docker compose up -d" to pull images and launch your projet

## Access your project

- Webserver (Nginx) : http://localhost:8080
- PhpMyAdmin : http://localhost:8180
- Php-fpm : http://localhost:9000