#!/bin/sh

# It's not important, but if you forgot in deluser in previous layer, it will be a problem for you
deluser app &> /dev/null
# $APP_USER_UID must be your host user!
adduser -h /home/app -u $APP_USER_UID -D app

# This need for cron jobs /var/www/html path is important -> must be workdir in Dockerfile
# cat /var/www/html/.crontab | crontab -u app -

exec /usr/bin/supervisord -n -c /etc/supervisord.conf