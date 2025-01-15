# docker_dev-env_php-fpm_sf-cli

A simple docker compose container with Nginx, PHP 8.4 (cli + fpm), Node.js 20.x, Mariadb 10, PhpMyAdmin, Symfony cli

## How to use 

- On macOS, install Orb Stack instead of official Docker Desktop: https://orbstack.dev/ 
  This will enhance performance on shared volumes.
- Make sure your IDE is configured to use **LF** file endings. This can break Docker Build if you use **CRLF**.
- Create a .env file based on .env.sample and adjust it to fit your needs.
    - cp .env.sample .env
    - vim .env
    - Set your UID to your host user id (run `id -u` in your terminal) to match permissions between host and container
- Run `docker compose build` to build your php cli/fpm environment
- Run `docker compose run --rm cli bash` to execute commands with PHP or Node in your container
- Launch the project with `docker compose up -d`
- Stop the project with `docker compose down`

## Setting up a Symfony 7.2 project

- From the compose.yml folder, run `docker compose run --rm cli bash` to enter the container:
- Execute `symfony new --no-git --webapp --version=7.2 .` to create a new Symfony project but do not initialize a git repository which will be done later.
- Launch the project with `docker compose up -d`

## Access your project

- Webserver (Nginx) : http://localhost:8080
- PhpMyAdmin : http://localhost:8180
