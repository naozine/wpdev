#!/bin/sh

### wordpress の初期設定
cd /var/www/html
wp --allow-root core install --url=localhost:8000 --title=temporary --admin_user=admin --admin_email=admin@localhost.com
wp --allow-root core language install ja --activate
wp --allow-root option update timezone_string 'Asia/Tokyo'

