#!/bin/bash

docker run -i --rm --name=certbot-proxy \
 -v $PWD/certbot/www/:/var/www/certbot/:rw \
 -v $PWD/certbot/conf/:/etc/letsencrypt/:rw \
 -v $PWD/certbot/log/:/var/log/letsencrypt/:rw \
 -p {{ansible_host}}:80:80 \
 certbot/certbot:latest \
 certonly --standalone \
 -w /var/www/certbot\
 --force-renewal \
 --email {{ monitoring_mail_from | default(monitoring_mail_user | default (letsencrypt_email) )}} \
 -d {{ monitoring_server_host | default (inventory_hostname) }} \
 --agree-tos --noninteractive
