#!/bin/bash

openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jpointil.42.fr" \
    -days 365 \
    -newkey rsa:4096


chmod 644 /etc/nginx/ssl/inception.crt
chmod 644 /etc/nginx/ssl/inception.key


nginx -g "daemon off;"