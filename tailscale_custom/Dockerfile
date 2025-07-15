FROM ghcr.io/home-assistant/aarch64-base:latest

RUN apk add --no-cache bash curl

# Instalar tailscale
RUN curl -fsSL https://pkgs.tailscale.com/stable/tailscale_1.66.4_arm64.tgz | tar -xz -C /usr/local/bin --strip-components=1

# Copiar script como servicio supervisado por s6 (no usar CMD)
COPY run /etc/services.d/tailscale/run
RUN chmod +x /etc/services.d/tailscale/run
