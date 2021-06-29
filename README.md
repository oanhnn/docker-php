# oanhnn/docker-php

[![Docker Pulls](https://img.shields.io/docker/pulls/oanhnn/php)](https://hub.docker.com/r/oanhnn/php)
[![Software License](https://img.shields.io/github/license/oanhnn/docker-php.svg)](LICENSE)

## Features

- [x] All images are build from PHP official images base on `buster` or `alpine`.
- [x] Install some PHP extensions: bcmath, gd, gmp, intl, opcache, pdo_mysql, pdo_pgsql, pcntl, zip, redis, xdebug

## Tags.

- All images are tag by format `oanhnn/php:<php-version>-<variant>`. Eg `oanhnn/php:7.4-fpm-alpine`
- PHP versions supported: `7.4`, `8.0`
- Variants supported: `apache`, `cli`, `fpm`, `zts`, `cli-alpine`, `fpm-alpine`

> Old versions supported:
> - `7.0-cli-alpine`, `7.0-fpm-alpine`, `7.0-zts-alpine`,
> - `7.1-cli-alpine`, `7.1-fpm-alpine`, `7.1-zts-alpine`, 
> - `7.2-cli-alpine`, `7.2-fpm-alpine`, `7.2-zts-alpine`, 
> - `7.3-cli-alpine`, `7.3-fpm-alpine`, `7.3-zts-alpine`, 

## Usage

- Use like with official image

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

## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/oanhnn/docker-php/issues).

## License

This project is released under the MIT License.   
Copyright © 2021 [Oanh Nguyen](https://github.com/oanhnn)   
Please see [License File](LICENSE) for more information.
