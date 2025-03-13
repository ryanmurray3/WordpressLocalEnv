#!/bin/bash

# Ensure HOSTNAME is set
if [[ -z "$HOSTNAME" ]]; then
  echo "HOSTNAME is not set. Please check your environment variables."
  exit 1
fi

# Small delay to allow other services to start up (optional)
sleep 2

# Some logging
echo
echo 'nginx is up and running. You should be able to access'
echo "it under: http://${HOSTNAME} or https://${HOSTNAME}"

# Start nginx like normal and catch errors
nginx -g 'daemon off;' || {
  echo "Failed to start NGINX"
  exit 1
}
