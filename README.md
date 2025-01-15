# docker_dev-env_php-fpm_sf-cli

A simple docker compose container with Nginx, PHP 8.4 (cli + fpm), Node.js 22.x, Mariadb 11, PhpMyAdmin, Symfony cli

## How to use 

This repository is a starter template for **one** project. You will be able to customize environment
for each project by editing the `.env` and `php/Dockerfile` file.

If you run every command inside your container (`docker compose run --rm cli`), you won't need to install PHP, 
Node.js, Composer, Symfony cli, etc. on your host machine.

- Clone this repository: `git clone https://github.com/Gr3G-RST/docker_dev-env_php-fpm_sf-cli.git my_project`
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

- Execute `docker compose run --rm --no-deps cli symfony new --no-git --webapp --version=7.2 .` to create a new Symfony project 
  but do not initialize a git repository which will be done later.
- Launch the project with `docker compose up -d`

## Remove this starter git repository

This repository is a starter template for **one** project. You must remove the git repository and start a new one with the following commands:

- `rm -rf .git`
- `git init`
- Remove `project` from `.gitignore` file once you created your Symfony project to track it with git.

## Access your project

- Webserver (Nginx) : http://localhost:8080
- PhpMyAdmin : http://localhost:8180
