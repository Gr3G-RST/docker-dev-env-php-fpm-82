# docker-dev-env-php-fpm-82
A simple docker compose container with Nginx, PHP 8.2 (cli + fpm), Mariadb 10, PhpMyAdmin

## How to use 

- Create à .env file based on .env.sample and adjust it to your needs.
- Run "docker compose build" to build your php cli/fpm environment
- Run "docker compose up -d" to pull images and launch your projet

## Your project 

- Files for your project has to be set up in the "project" directory

## Acces

- Webserver (Nginx) serve pages at : http://localhost:8080
- PhpMyAdmin : http://localhot:8180
- Php-fpm : http://localhost:9000