# Arguments
ARG BRANCH
ARG COMMIT
ARG DATE
ARG URL
ARG VERSION

# Base Image
FROM php:7.4-fpm-alpine

# Labels
LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.vendor="Oanh Nguyen" \
    org.label-schema.name="oanhnn/php" \
    org.label-schema.description="The PHP Docker Image" \
    org.label-schema.url="https://hub.docker.com/r/oanhnn/php" \
    org.label-schema.build-date=$DATE \
    org.label-schema.version="$VERSION" \
    org.label-schema.vcs-url="$URL" \
    org.label-schema.vcs-branch="$BRANCH" \
    org.label-schema.vcs-ref="$COMMIT"

# Enviroments
ENV PHP_ENABLE_XDEBUG=0 \
    PHP_MEMORY_LIMIT=128M \
    PHP_MAX_EXEC_TIME=30 \
    PHP_MAX_FILE_UPLOADS=20 \
    PHP_POST_MAX_SIZE=8M \
    PHP_UPLOAD_MAX_SIZE=2M \
    PHP_TIMEZONE=UTC

RUN set -eux; \
    \
    # Install some php extensions
    apk add --update --no-cache --virtual .build-deps \
        freetype-dev \
        gmp-dev \
        icu-dev \
        imagemagick-dev \
        libintl \
        libjpeg-turbo-dev \
        libpng-dev \
        libxml2-dev \
        libzip-dev \
        postgresql-dev \
        zlib-dev \
        $PHPIZE_DEPS \
    ; \
    docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    ; \
    docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" \
        bcmath \
        gd \
        gmp \
        intl \
        opcache \
        pdo_mysql \
        pdo_pgsql \
        pcntl \
        sockets \
        zip \
    ; \
    \
    # Install some extensions
    pecl update-channels; \
    pecl install \
        imagick \
        redis \
        # xdebug \
    ; \
    docker-php-ext-enable imagick redis; \
    rm -rf /tmp/pear ~/.pearrc; \
    \
    # Install runtime libraries
    runDeps="$( \
        scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
            | tr ',' '\n' \
            | sort -u \
            | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )"; \
    apk add --update --no-cache --virtual .run-deps $runDeps; \
    apk del .build-deps; \
    \
    # smoke test
    php --version

# Modify docker entrypoint
COPY docker-php-entrypoint /usr/local/bin/
ENTRYPOINT [ "docker-php-entrypoint" ]
