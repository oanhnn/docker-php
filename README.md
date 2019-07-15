# oanhnn/docker-php

## Docker image.

<table>
  <tr>
    <th>PHP Version</th>
    <th>CLI - Alpine</th>
    <th>FPM - Alpine</th>
  </tr>
  <tr>
    <td>7.0</td>
    <td>
      <a href="https://microbadger.com/images/oanhnn/php:7.0-cli-alpine" title="7.0-cli-alpine"><img src="https://images.microbadger.com/badges/version/oanhnn/php:7.0-cli-alpine.svg" alt="7.0-cli-alpine"/></a>
      <a href="https://travis-ci.org/oanhnn/docker-php" title="7.0-cli-alpine"><img src="https://travis-ci.org/oanhnn/docker-php.svg?branch=7.0-cli-alpine" alt="7.0-cli-alpine"/></a>
    </td>
    <td>
      <a href="https://microbadger.com/images/oanhnn/php:7.0-fpm-alpine" title="7.0-fpm-alpine"><img src="https://images.microbadger.com/badges/version/oanhnn/php:7.0-fpm-alpine.svg" alt="7.0-fpm-alpine"/></a>
      <a href="https://travis-ci.org/oanhnn/docker-php" title="7.0-fpm-alpine"><img src="https://travis-ci.org/oanhnn/docker-php.svg?branch=7.0-fpm-alpine" alt="7.0-fpm-alpine"/></a>
    </td>
  </tr>
  <tr>
    <td>7.1</td>
    <td>
      <a href="https://microbadger.com/images/oanhnn/php:7.1-cli-alpine" title="7.1-cli-alpine"><img src="https://images.microbadger.com/badges/version/oanhnn/php:7.1-cli-alpine.svg" alt="7.1-cli-alpine"/></a>
      <a href="https://travis-ci.org/oanhnn/docker-php" title="7.1-cli-alpine"><img src="https://travis-ci.org/oanhnn/docker-php.svg?branch=7.1-cli-alpine" alt="7.1-cli-alpine"/></a>
    </td>
    <td>
      <a href="https://microbadger.com/images/oanhnn/php:7.1-fpm-alpine" title="7.1-fpm-alpine"><img src="https://images.microbadger.com/badges/version/oanhnn/php:7.1-fpm-alpine.svg" alt="7.1-fpm-alpine"/></a>
      <a href="https://travis-ci.org/oanhnn/docker-php" title="7.1-fpm-alpine"><img src="https://travis-ci.org/oanhnn/docker-php.svg?branch=7.1-fpm-alpine" alt="7.1-fpm-alpine"/></a>
    </td>
  </tr>
  <tr>
    <td>7.2</td>
    <td>
      <a href="https://microbadger.com/images/oanhnn/php:7.2-cli-alpine" title="7.2-cli-alpine"><img src="https://images.microbadger.com/badges/version/oanhnn/php:7.2-cli-alpine.svg" alt="7.2-cli-alpine"/></a>
      <a href="https://travis-ci.org/oanhnn/docker-php" title="7.2-cli-alpine"><img src="https://travis-ci.org/oanhnn/docker-php.svg?branch=7.2-cli-alpine" alt="7.2-cli-alpine"/></a>
    </td>
    <td>
      <a href="https://microbadger.com/images/oanhnn/php:7.2-fpm-alpine" title="7.2-fpm-alpine"><img src="https://images.microbadger.com/badges/version/oanhnn/php:7.2-fpm-alpine.svg" alt="7.2-fpm-alpine"/></a>
      <a href="https://travis-ci.org/oanhnn/docker-php" title="7.2-fpm-alpine"><img src="https://travis-ci.org/oanhnn/docker-php.svg?branch=7.2-fpm-alpine" alt="7.2-fpm-alpine"/></a>
    </td>
  </tr>
  <tr>
    <td>7.3</td>
    <td>
      <a href="https://microbadger.com/images/oanhnn/php:7.3-cli-alpine" title="7.3-cli-alpine"><img src="https://images.microbadger.com/badges/version/oanhnn/php:7.3-cli-alpine.svg" alt="7.3-cli-alpine"/></a>
      <a href="https://travis-ci.org/oanhnn/docker-php" title="7.3-cli-alpine"><img src="https://travis-ci.org/oanhnn/docker-php.svg?branch=7.3-cli-alpine" alt="7.3-cli-alpine"/></a>
    </td>
    <td>
      <a href="https://microbadger.com/images/oanhnn/php:7.3-fpm-alpine" title="7.3-fpm-alpine"><img src="https://images.microbadger.com/badges/version/oanhnn/php:7.3-fpm-alpine.svg" alt="7.3-fpm-alpine"/></a>
      <a href="https://travis-ci.org/oanhnn/docker-php" title="7.3-fpm-alpine"><img src="https://travis-ci.org/oanhnn/docker-php.svg?branch=7.3-fpm-alpine" alt="7.3-fpm-alpine"/></a>
    </td>
  </tr>
  <tr>
    <td>7.4</td>
    <td>
      <a href="https://microbadger.com/images/oanhnn/php:7.4-cli-alpine" title="7.4-cli-alpine"><img src="https://images.microbadger.com/badges/version/oanhnn/php:7.4-cli-alpine.svg" alt="7.4-cli-alpine"/></a>
      <a href="https://travis-ci.org/oanhnn/docker-php" title="7.4-cli-alpine"><img src="https://travis-ci.org/oanhnn/docker-php.svg?branch=7.4-cli-alpine" alt="7.4-cli-alpine"/></a>
    </td>
    <td>
      <a href="https://microbadger.com/images/oanhnn/php:7.4-fpm-alpine" title="7.4-fpm-alpine"><img src="https://images.microbadger.com/badges/version/oanhnn/php:7.4-fpm-alpine.svg" alt="7.4-fpm-alpine"/></a>
      <a href="https://travis-ci.org/oanhnn/docker-php" title="7.4-fpm-alpine"><img src="https://travis-ci.org/oanhnn/docker-php.svg?branch=7.4-fpm-alpine" alt="7.4-fpm-alpine"/></a>
    </td>
  </tr>
</table>

## Features

- [x] Base from PHP official image
- [x] Install some PHP extensions: bcmath, gd, gmp, intl, opcache, pdo_mysql, pdo_pgsql, pcntl, zip, redis, imagick, xdebug
- [x] Enable XDebug extension by environment variable

## Usage

- Use like with official image
- Set environment variable `PHP_ENABLE_XDEBUG=1` to enable XDebug extension

## Environment variable

| Environment variable   | Default | Note |
|------------------------|---------|------|
| `PHP_ENABLE_XDEBUG`    | `0`     | Enable XDebug extension |
| `PHP_MEMORY_LIMIT`     | `128M`  | Value of `memory_limit` in `php.ini` |
| `PHP_MAX_EXEC_TIME`    | `30`    | Value of `max_execution_time` in `php.ini` |
| `PHP_MAX_FILE_UPLOADS` | `20`    | Value of `max_file_uploads` in `php.ini` |
| `PHP_POST_MAX_SIZE`    | `8M`    | Value of `post_max_size` in `php.ini` |
| `PHP_UPLOAD_MAX_SIZE`  | `2M`    | Value of `upload_max_filesize` in `php.ini` |
| `PHP_TIMEZONE`         | `UTC`   | Value of `date.timezone` in `php.ini` |

## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/oanhnn/docker-php/issues).

## License

This project is released under the MIT License.   
Copyright © 2018 [Oanh Nguyen](https://github.com/oanhnn)   
Please see [License File](./LICENSE) for more information.
