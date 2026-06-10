#!/usr/bin/env bash
set -e

# Initialize directories
mkdir -p /data /ssl/npmplus

# Read Home Assistant options if they exist
CONFIG_PATH=/data/options.json

if [ -f "$CONFIG_PATH" ]; then
  # Extract timezone
  TZ=$(jq -r '.timezone // "UTC"' "$CONFIG_PATH" 2>/dev/null || echo "UTC")
  export TZ

  # Extract ACME email if provided
  ACME_EMAIL=$(jq -r '.acme_email // empty' "$CONFIG_PATH" 2>/dev/null)
  if [ -n "$ACME_EMAIL" ] && [ "$ACME_EMAIL" != "null" ]; then
    export ACME_EMAIL
  fi
else
  # No options file, use defaults
  export TZ="UTC"
fi

# Start NPMplus init process
exec /init
