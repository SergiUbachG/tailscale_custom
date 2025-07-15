#!/usr/bin/with-contenv bashio

AUTH_KEY=$(bashio::config 'auth_key')

echo "[INFO] Starting tailscaled..."
/usr/local/bin/tailscaled &

TAILSCALED_PID=$!

for i in $(seq 1 20); do
  if /usr/local/bin/tailscale status &>/dev/null; then
    echo "[INFO] tailscaled ready"
    break
  fi
  echo "[INFO] Waiting for tailscaled..."
  sleep 2
done

/usr/local/bin/tailscale up --authkey "$AUTH_KEY" --hostname hass-tailscale

# Esperar a que tailscaled se mantenga vivo
while kill -0 "$TAILSCALED_PID" 2>/dev/null; do
  sleep 10
done

echo "[ERROR] tailscaled exited"
exit 1
