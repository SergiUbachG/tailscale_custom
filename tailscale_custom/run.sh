#!/usr/bin/with-contenv bashio

AUTH_KEY=$(bashio::config 'auth_key')

tailscaled &

sleep 5

until tailscale status &> /dev/null; do
  echo "Esperando a tailscaled..."
  sleep 2
done

tailscale up --authkey "$AUTH_KEY" --hostname hass-tailscale

tail -f /dev/null
