#!/bin/bash

docker stop nginx_nginx_1
PATH=`echo $PATH`
/usr/local/bin/letsencrypt renew
docker start nginx_nginx_1
