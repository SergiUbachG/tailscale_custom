ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-python:3.11
FROM ${BUILD_FROM}

COPY rootfs/ /

# Damos permisos al script de s6
RUN chmod a+x /etc/services.d/tailscale/run

