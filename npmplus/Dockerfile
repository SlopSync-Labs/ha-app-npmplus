# Use the official NPMplus image directly.
# BUILD_FROM is declared to satisfy HA's build tooling but not used.
ARG BUILD_FROM
FROM zoeyvid/npmplus:latest

# Install jq for JSON parsing in init script
RUN apk add --no-cache jq

# Redirect Let's Encrypt to HA's shared SSL directory
RUN mkdir -p /ssl/npmplus /app/config && \
    rm -rf /app/config/letsencrypt && \
    ln -s /ssl/npmplus /app/config/letsencrypt

# Copy HA initialization script for s6-overlay
COPY cont-init.d/01-ha-setup.sh /etc/cont-init.d/01-ha-setup.sh
RUN chmod +x /etc/cont-init.d/01-ha-setup.sh

EXPOSE 80 81 443

# Do NOT override ENTRYPOINT — s6-overlay (/init) must run as PID 1
