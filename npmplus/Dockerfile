# Use the official NPMplus image directly.
# BUILD_FROM is declared to satisfy HA's build tooling but not used —
# we want the full NPMplus image, not a minimal HA base.
ARG BUILD_FROM
FROM zoeyvid/npmplus:latest

# Install jq for JSON parsing in startup script
RUN apk add --no-cache jq

# Redirect Let's Encrypt certificate storage to /ssl/npmplus so certs
# are accessible to other HA add-ons via HA's shared SSL directory.
RUN mkdir -p /ssl/npmplus /app/config && \
    rm -rf /app/config/letsencrypt && \
    ln -s /ssl/npmplus /app/config/letsencrypt

# Copy HA-specific init script for configuration
COPY cont-init.d/01-ha-setup.sh /etc/cont-init.d/01-ha-setup.sh
RUN chmod +x /etc/cont-init.d/01-ha-setup.sh

EXPOSE 80 81 443

# Do NOT override ENTRYPOINT — s6-overlay (/init) must run as PID 1
