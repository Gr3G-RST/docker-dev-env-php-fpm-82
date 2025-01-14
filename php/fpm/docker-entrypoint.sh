#!/bin/sh

if [ ${PHP_ENABLE_AMQP} -eq "1" ]; then
    docker-php-ext-enable amqp
    echo "-- php amqp extension enabled"
fi

if [ ${PHP_ENABLE_REDIS} -eq "1" ]; then
    docker-php-ext-enable redis
    echo "-- php redis extension enabled"
fi

if [ ${PHP_ENABLE_XDEBUG} -eq "1" ]; then
    docker-php-ext-enable xdebug
    echo "-- php xdebug extension enabled"
fi

exec "$@"