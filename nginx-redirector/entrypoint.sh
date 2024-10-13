#!/bin/bash

: ${REDIRECT_STATUS:=301}

envsubst '$SERVER_NAME $REDIRECT_URL $REDIRECT_STATUS' < /etc/nginx/templates/nginx.conf.template > /etc/nginx/conf.d/nginx.conf

nginx -g 'daemon off;'
