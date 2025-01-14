# docker-dev-env-php-fpm-82

A simple docker compose container with Nginx, PHP 8.2 (cli + fpm), Node.js 20.x, Mariadb 10, PhpMyAdmin

## How to use 

- Create a .env file based on .env.sample and adjust it to your needs.
- Run "docker compose build" to build your php cli/fpm environment
- Run "docker compose up -d" to pull images and launch your projet

## Your project 

- Files for your project has to be set up in the "project" directory.
  Typically this is where you will install your favorite framework.
  In this default config, Nginx is setup for Symfony. You need to edit ./nginx/nginx.conf (line 10) to adjust the Nginx root folder.


## Access your project

- Webserver (Nginx) : http://localhost:8080
- PhpMyAdmin : http://localhost:8180
- Php-fpm : http://localhost:9000