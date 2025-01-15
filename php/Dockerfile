ARG PHP_VERSION
ARG NODE_VERSION
ARG COMPOSER_VERSION=2.8.1
ARG PHP_EXTENSION_INSTALLER_VERSION=2.6.0
ARG PHP_EXTENSION_REDIS_VERSION=6.1.0
ARG PHP_ENABLE_AMQP
ARG PHP_ENABLE_REDIS
ARG PHP_ENABLE_XDEBUG
ARG UID=1000


FROM php:${PHP_VERSION}-fpm-bookworm AS base-php

ARG UID

LABEL org.opencontainers.image.authors="roussatgregory@gmail.com"

ENV PHP_ENABLE_AMQP ${PHP_ENABLE_AMQP}
ENV PHP_ENABLE_REDIS ${PHP_ENABLE_REDIS}
ENV PHP_ENABLE_XDEBUG ${PHP_ENABLE_XDEBUG}
ENV PROJECT_ROOT "/var/www/project"

SHELL ["/bin/bash", "-e", "-o", "pipefail", "-c"]

# Installing required packages
RUN <<EOF
echo "PHP_VERSION: ${PHP_VERSION}"
echo "NODE_VERSION: ${NODE_VERSION}"
apt-get --quiet update
apt-get --quiet --yes --purge --autoremove upgrade
# Packages - System
apt-get --quiet --yes --no-install-recommends --verbose-versions install \
    procps \
    curl \
    sudo \
    git \
    vim \
    zip \
    unzip \
    mariadb-client \
    wget

# Keep docker image size small
rm -rf /var/lib/apt/lists/*

# Change www-data UID and GID to match host user
groupmod -g ${UID} www-data
usermod -u ${UID} -g ${UID} www-data
chown -R www-data:www-data /var/www

# Installing extensions
curl -L https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions \
    -o /usr/local/bin/install-php-extensions
chmod +x /usr/local/bin/install-php-extensions

# Installing PHP extensions
install-php-extensions \
    @composer-${COMPOSER_VERSION} \
    bcmath \
    exif \
    fileinfo \
    gd \
    gmp \
    iconv \
    intl \
    json \
    mbstring \
    opcache \
    openssl \
    pcntl \
    pdo_mysql \
    simplexml \
    xsl \
    zip

IPE_DONT_ENABLE=1 install-php-extensions \
    amqp \
    redis-${PHP_EXTENSION_REDIS_VERSION} \
    xdebug
EOF


FROM base-php AS php-cli

ARG NODE_VERSION
ARG UID

SHELL ["/bin/bash", "-e", "-o", "pipefail", "-c"]

# Configs
RUN ln -sf ${PHP_INI_DIR}/php.ini-development ${PHP_INI_DIR}/php.ini
COPY --link conf.d/app.dev.ini ${PHP_INI_DIR}/conf.d/zz-app.ini
COPY --link cli-docker-entrypoint.sh /root/docker-entrypoint.sh

RUN <<EOF
chown -R www-data:www-data /var/www
echo "www-data ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/www-data
chmod +x /root/docker-entrypoint.sh
EOF

# Switch to www-data user
USER www-data

RUN <<EOF
# Download and install NVM:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# Download and install Node.js:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install ${NODE_VERSION}
nvm current
# Download and install yarn:
corepack enable yarn
export NODE_PATH=$(which node)
export YARN_PATH=$(which yarn)
sudo ln -s $NODE_PATH /usr/local/bin/node
sudo ln -s $YARN_PATH /usr/local/bin/yarn

# Installing Symfony CLI
curl -sS https://get.symfony.com/cli/installer | bash
sudo mv $HOME/.symfony5/bin/symfony /usr/local/bin/symfony
EOF

CMD ["/root/docker-entrypoint.sh", "bash"]

VOLUME /var/www/project


FROM base-php AS php-fpm

SHELL ["/bin/bash", "-e", "-o", "pipefail", "-c"]

# Configs
COPY --link conf.d/app.dev.ini ${PHP_INI_DIR}/conf.d/zz-app.ini
COPY --link fpm-docker-entrypoint.sh /root/docker-entrypoint.sh
RUN ln -sf ${PHP_INI_DIR}/php.ini-development ${PHP_INI_DIR}/php.ini
RUN chmod +x /root/docker-entrypoint.sh

# Switch to www-data user
USER www-data

CMD ["/root/docker-entrypoint.sh", "php-fpm", "-F"]
