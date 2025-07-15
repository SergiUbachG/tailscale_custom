FROM ghcr.io/home-assistant/aarch64-base:latest

RUN apk add --no-cache bash curl

RUN curl -fsSL https://pkgs.tailscale.com/stable/tailscale_1.66.4_arm64.tgz | tar -xz -C /usr/local/bin --strip-components=1

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
