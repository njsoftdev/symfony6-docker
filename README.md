### Setup and run

1. If not already done, install Docker Compose
2. Run `cd dockerfiles/app/1.0 && docker build -t php_nginx_supervisor:1.0 .` to build fresh images
3. Run `export APP_USER_UID=$UID && docker-compose up` (the logs will be displayed in the current shell)
4. Then go to shell under `app user` and check versions `composer --version`, `php --version`, `symfony version` and check requirements `symfony check:requirements`
5. Then go to shell and set git config


```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

Then install `symfony new app1 --webapp`

Then remove `composer remove symfony/webpack-encore-bundle`

Then remove `.git dir in app1`

### Docker override example

```yaml
version: '3.4'
services:
  symfony:
    volumes:
      - ${PWD}/conf/nginx/nginx.conf:/etc/nginx/nginx.conf
      - ${PWD}/conf/nginx/app.conf:/etc/nginx/http.d/default.conf
      - ${PWD}/conf/php/conf.d/symfony.dev.ini:/usr/local/etc/php/conf.d/symfony.ini
      - ${PWD}/conf/php/php-fpm.d/zz-docker.conf:/usr/local/etc/php-fpm.d/zz-docker.conf
      - ${PWD}/app:/var/www/html
```
