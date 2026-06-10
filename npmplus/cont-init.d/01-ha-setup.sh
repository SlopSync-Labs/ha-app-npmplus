#!/bin/sh
# Initializes Home Assistant-specific directories and configuration for NPMplus.
# Runs early in s6's cont-init sequence before NPMplus services start.

# Create required directories
mkdir -p /data /ssl/npmplus

# Read Home Assistant options if they exist
CONFIG_PATH=/data/options.json

if [ -f "$CONFIG_PATH" ]; then
  # Extract timezone (required)
  export TZ=$(jq -r '.timezone // "UTC"' "$CONFIG_PATH" 2>/dev/null || echo "UTC")

  # Extract optional ACME email
  ACME_EMAIL=$(jq -r '.acme_email // empty' "$CONFIG_PATH" 2>/dev/null)
  if [ -n "$ACME_EMAIL" ]; then
    export ACME_EMAIL
  fi

  # Extract optional NPM port override
  NPM_PORT=$(jq -r '.npm_port // empty' "$CONFIG_PATH" 2>/dev/null)
  if [ -n "$NPM_PORT" ] && [ "$NPM_PORT" != "null" ]; then
    export NPM_PORT
  fi

  # Extract optional disable HTTP flag
  DISABLE_HTTP=$(jq -r '.disable_http // empty' "$CONFIG_PATH" 2>/dev/null)
  if [ "$DISABLE_HTTP" = "true" ]; then
    export DISABLE_HTTP=true
  fi
else
  # No options file, use defaults
  export TZ="UTC"
fi
