FROM php:{{ env.from }}

RUN set -eux; \
    \
    savedAptMark="$(apt-mark showmanual)"; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libgmp-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libpq-dev \
        libzip-dev \
        $PHPIZE_DEPS \
    ; \
    docker-php-ext-configure gd \
{{ if env.version == "7.3" then ( -}}
        --with-freetype-dir=/usr \
        --with-jpeg-dir=/usr \
{{ ) else ( -}}
        --with-freetype=/usr/include/ \
        --with-jpeg=/usr/include/ \
{{ ) end -}}
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
    pecl update-channels; \
    pecl install \
        redis \
        xdebug \
    ; \
    docker-php-ext-enable redis; \
    rm -rf /tmp/pear ~/.pearrc; \
    apt-mark auto '.*' > /dev/null; \
    apt-mark manual $savedAptMark; \
    find /usr/local -type f -executable -exec ldd '{}' ';' \
        | awk '/=>/ { print $(NF-1) }' \
        | sort -u \
        | xargs -r dpkg-query --search \
        | cut -d: -f1 \
        | sort -u \
        | xargs -r apt-mark manual \
    ; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    \
    php --version
