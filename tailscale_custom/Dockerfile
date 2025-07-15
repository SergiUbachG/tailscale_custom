FROM ghcr.io/hassio-addons/base:12.2.7

# Instal·lar curl i bash
RUN apk add --no-cache curl bash

# Instal·lar Tailscale
RUN curl -fsSL https://pkgs.tailscale.com/stable/tailscale_1.66.4_arm64.tgz | tar -xz -C /usr/local/bin --strip-components=1

# Afegir el servei supervisat per s6
COPY run /etc/services.d/tailscale/run
RUN chmod +x /etc/services.d/tailscale/run
