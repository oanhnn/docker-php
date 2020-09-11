# oanhnn/docker-php

[![Docker Pulls](https://img.shields.io/docker/pulls/oanhnn/php)](https://hub.docker.com/r/oanhnn/php)
[![Software License](https://img.shields.io/github/license/oanhnn/docker-php.svg)](LICENSE)

## Features

- [x] Base from PHP official images
- [x] Install some PHP extensions: bcmath, gd, gmp, intl, opcache, pdo_mysql, pdo_pgsql, pcntl, zip, redis, imagick, xdebug

## Tags.

- All images are tag by format `oanhnn/php:<php-version>-<variant>`. Eg `oanhnn/php:7.4-fpm-alpine`
- PHP version supported: `7.0`, `7.1`, `7.2`, `7.3`, `7.4`, `8.0-rc`
- Variants supported: `apache`, `cli`, `fpm`, `zts`, `cli-alpine`, `fpm-alpine`, `zts-alpine`

> All images are build from PHP official images base on `buster` or `alpine`

## Usage

- Use like with official image

## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/oanhnn/docker-php/issues).

## License

This project is released under the MIT License.   
Copyright © 2020 [Oanh Nguyen](https://github.com/oanhnn)   
Please see [License File](./LICENSE) for more information.
