# docker_dev-env_php-fpm_sf-cli

A simple docker compose container with Nginx, PHP 8.4 (cli + fpm), Node.js 20.x, Mariadb 10, PhpMyAdmin, Symfony cli

## How to use 

- Create a .env file based on .env.sample and adjust it to fit your needs.
    - cp .env.sample .env
    - vim .env
- Run "docker compose build" to build your php cli/fpm environment
- Run "docker compose up -d" to pull images and launch your projet
- Test with "docker compose exec cli bash"

## Setting up a Symfony 7.2 project

- From the docker-compose.yml folder :
    - RUN : curl -sS https://get.symfony.com/cli/installer | bash
    - RUN : export PATH="$HOME/.symfony5/bin:$PATH"
    - RUN symfony new --webapp --version=7.2 project
 

## Access your project

- Webserver (Nginx) : http://localhost:8080
- PhpMyAdmin : http://localhost:8180
- Php-fpm : http://localhost:9000