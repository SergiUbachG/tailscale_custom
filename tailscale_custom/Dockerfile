ARG BUILD_FROM=ghcr.io/home-assistant/amd64-addon-base:14.2.1
FROM ${BUILD_FROM}

# Copiamos todo el rootfs con s6 services
COPY rootfs/ /

# Permisos
RUN chmod a+x /etc/services.d/tailscale/run

# (Opcional) Instalar tailscale si no viene preinstalado
RUN apk add --no-cache tailscale
