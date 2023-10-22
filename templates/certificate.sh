#!/bin/bash

{% if monitoring_certificate | default ('letsencrypt') == 'letsencrypt' %}
# Generate certificate using letsencrypt
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
{% else %}
# Generate self-signed certificate
mkdir -p $PWD/certbot/conf/live/{{ monitoring_server_host | default (inventory_hostname) }}
openssl req -x509 -newkey rsa:2048 \
    -keyout $PWD/certbot/conf/live/{{ monitoring_server_host | default (inventory_hostname) }}/privkey.pem \
    -out    $PWD/certbot/conf/live/{{ monitoring_server_host | default (inventory_hostname) }}/fullchain.pem \
    -days 3650 -nodes -subj "/CN={{ monitoring_server_host | default (inventory_hostname) }}"
{% endif %}