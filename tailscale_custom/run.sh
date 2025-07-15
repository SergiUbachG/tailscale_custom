#!/usr/bin/with-contenv bashio

# Leer el auth_key desde la configuración del usuario
AUTH_KEY=$(bashio::config 'auth_key')

# Iniciar tailscaled en segundo plano
echo "[INFO] Iniciando tailscaled..."
/usr/local/bin/tailscaled &
TAILSCALED_PID=$!

# Esperar a que tailscaled esté listo
echo "[INFO] Esperando a que tailscaled esté disponible..."
for i in $(seq 1 20); do
  if /usr/local/bin/tailscale status &>/dev/null; then
    echo "[INFO] tailscaled está activo."
    break
  fi
  echo "[INFO] Intento $i/20: tailscaled aún no está listo..."
  sleep 2
done

# Ejecutar tailscale up
echo "[INFO] Ejecutando tailscale up..."
/usr/local/bin/tailscale up --authkey "$AUTH_KEY" --hostname hass-tailscale

# Mostrar IP asignada por Tailscale
echo "[INFO] Dirección IP de Tailscale:"
/usr/local/bin/tailscale ip -4 || echo "[WARN] No se pudo obtener IP."

# Mantener el contenedor activo
echo "[INFO] Add-on en ejecución. tailscaled PID: $TAILSCALED_PID"
while kill -0 "$TAILSCALED_PID" 2>/dev/null; do
  sleep 10
done

echo "[ERROR] tailscaled ha terminado inesperadamente. Saliendo..."
exit 1
