#!/bin/bash

service php7.3-fpm start
service mysql start
service nginx reload
nginx -g 'daemon off;'
