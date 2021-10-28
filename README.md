# oanhnn/docker-php

[![CI](https://github.com/oanhnn/docker-php/actions/workflows/ci.yml/badge.svg)](https://github.com/oanhnn/docker-php/actions/workflows/ci.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/oanhnn/php)](https://hub.docker.com/r/oanhnn/php)
[![Software License](https://img.shields.io/github/license/oanhnn/docker-php.svg)](LICENSE.md)

## Features

- [x] All images are build from PHP official images.
- [x] Install some PHP extensions: bcmath, gd, gmp, intl, opcache, pdo_mysql, pdo_pgsql, pcntl, zip, redis, xdebug

```shell
$ docker run --rm oanhnn/php:7.4-cli -m
[PHP Modules]
bcmath
Core
ctype
curl
date
dom
fileinfo
filter
ftp
gd
gmp
hash
iconv
intl
json
libxml
mbstring
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_pgsql
pdo_sqlite
Phar
posix
readline
redis
Reflection
session
SimpleXML
sockets
sodium
SPL
sqlite3
standard
tokenizer
xml
xmlreader
xmlwriter
Zend OPcache
zip
zlib

[Zend Modules]
Zend OPcache

```

## Tags.

<table style="border: 1px">
    <tr>
        <th rowspan="2">Version</th>
        <th colspan="7">Variants</th>
    </tr>
    <tr>
        <th>apache</th>
        <th>cli</th>
        <th>fpm</th>
        <th>zts</th>
        <th>cli-alpine</th>
        <th>fpm-alpine</th>
        <th>zts-alpine</th>
    </tr>
    <tr>
        <th>7.0</th>
        <td>7.0-apache</td>
        <td>7.0-cli</td>
        <td>7.0-fpm</td>
        <td>7.0-zts</td>
        <td>7.0-cli-alpine</td>
        <td>7.0-fpm-alpine</td>
        <td>7.0-zts-alpine</td>
    </tr>
    <tr>
        <th>7.1</th>
        <td>7.1-apache</td>
        <td>7.1-cli</td>
        <td>7.1-fpm</td>
        <td>7.1-zts</td>
        <td>7.1-cli-alpine</td>
        <td>7.1-fpm-alpine</td>
        <td>7.1-zts-alpine</td>
    </tr>
    <tr>
        <th>7.2</th>
        <td>7.2-apache</td>
        <td>7.2-cli</td>
        <td>7.2-fpm</td>
        <td>7.2-zts</td>
        <td>7.2-cli-alpine</td>
        <td>7.2-fpm-alpine</td>
        <td>7.2-zts-alpine</td>
    </tr>
    <tr>
        <th>7.3</th>
        <td>7.3-apache</td>
        <td>7.3-cli</td>
        <td>7.3-fpm</td>
        <td>7.3-zts</td>
        <td>7.3-cli-alpine</td>
        <td>7.3-fpm-alpine</td>
        <td>7.3-zts-alpine</td>
    </tr>
    <tr>
        <th>7.4</th>
        <td>7.4-apache</td>
        <td>7.4-cli</td>
        <td>7.4-fpm</td>
        <td>7.4-zts</td>
        <td>7.4-cli-alpine</td>
        <td>7.4-fpm-alpine</td>
        <td></td>
    </tr>
    <tr>
        <th>8.0</th>
        <td>8.0-apache</td>
        <td>8.0-cli</td>
        <td>8.0-fpm</td>
        <td>8.0-zts</td>
        <td>8.0-cli-alpine</td>
        <td>8.0-fpm-alpine</td>
        <td></td>
    </tr>
    <tr>
        <th>8.1-rc</th>
        <td>8.1-rc-apache</td>
        <td>8.1-rc-cli</td>
        <td>8.1-rc-fpm</td>
        <td>8.1-rc-zts</td>
        <td>8.1-rc-cli-alpine</td>
        <td>8.1-rc-fpm-alpine</td>
        <td></td>
    </tr>
</table>


## Usage

- Use like with official image

```
docker run -d --rm -p 9000:9000 -v $(pwd):/var/www oanhnn/php:8.0-fpm
```

## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/oanhnn/docker-php/issues).

## Security Vulnerabilities

Please review [our security policy](../../security/policy) on how to report security vulnerabilities.

## Credits

- [Oanh Nguyen](https://github.com/oanhnn)
- [All Contributors](../../contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
