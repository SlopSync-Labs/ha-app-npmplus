# NPMplus

![Version][version-shield]
![Project Stage][project-stage-shield]
![Maintained][maintenance-shield]

[![Community Forum][forum-shield]][forum]
[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

Enhanced reverse proxy manager with HTTP/3, OIDC, mTLS, and advanced security features.
This app (v0.1.0) runs the **latest** [zoeyvid/npmplus](https://github.com/ZoeyVid/NPMplus) image.
NPMplus is a fork of [nginx-proxy-manager](https://github.com/NginxProxyManager/nginx-proxy-manager) with additional enterprise-grade features.

## Features

- Free SSL via Let's Encrypt (HTTP-01 and DNS-01 challenges)
- Reverse proxy with custom locations, websocket support, and access lists
- Redirect and 404 hosts
- Beautiful web UI with HTTPS security (port 443)
- HTTP/3 (QUIC) support for modern browsers
- OIDC authentication integration
- mTLS support with custom CA certificates
- CrowdSec and OpenAppSec integration
- Goaccess analytics dashboard
- ACME profile support (Let's Encrypt, custom servers, etc.)
- Enhanced privacy (local Gravatar caching, local QR code generation)
- PHP and file server support with compression (zstd, brotli)

## Ports

| Port | Protocol | Description              |
| ---- | -------- | ------------------------ |
| 80   | TCP      | HTTP proxy traffic       |
| 81   | TCP      | Admin UI (HTTPS)         |
| 443  | TCP      | HTTPS proxy traffic      |
| 443  | UDP      | HTTP/3 (QUIC) traffic    |

**Important**: Port 443 must be exposed as **both TCP and UDP** to support HTTP/3.

## Configuration

This app requires the following settings (configure via Home Assistant app options):

| Option | Required | Default | Description |
| ------ | -------- | ------- | ----------- |
| `timezone` | Yes | `UTC` | Timezone for NPMplus (e.g., `America/New_York`, `Europe/London`) |
| `acme_email` | No | `` | Email for Let's Encrypt certificate registration (recommended) |
| `npm_port` | No | `81` | Port for the admin interface (1024–65535) |
| `disable_http` | No | `false` | Disable HTTP (port 80), require HTTPS only |

## Initial access

After the app starts, open the admin UI at `https://<your-ha-ip>:81` (or your configured NPM port) and
follow the onboarding/login flow. Default credentials are documented in the NPMplus repository.

## Data persistence

NPMplus's database and configuration are stored in the app's `/data` directory and
persist across restarts and updates.

Let's Encrypt certificates are stored at `/ssl/npmplus` — HA's shared SSL directory.
This means certificates issued by NPMplus are accessible to other HA apps that map
the `ssl` volume (e.g., other proxy apps). Certificate paths follow the standard
Let's Encrypt layout:

```text
/ssl/npmplus/live/npm-1/fullchain.pem
/ssl/npmplus/live/npm-1/privkey.pem
```

## Upgrading

Update the app through the Home Assistant UI when a new version is published.

Your NPMplus data, configuration, and certificates are stored under `/data`, so they
persist across normal app upgrades and restarts.

After upgrading, verify that:

1. The app starts successfully.
2. The admin UI is reachable on port 443.
3. Existing proxy hosts, certificates, and settings are still present.

## Important notes

- Ports 80 and 443 must be free on the host — disable HA's built-in nginx if it occupies them.
- This add-on does **not** use a HA base image; it uses the official NPMplus Docker image directly.
- **Architecture**: Only amd64 (x86-64-v2+) and aarch64 are supported; armv7, armhf, and i386 are not supported.
- **License**: NPMplus is distributed under the GNU Affero General Public License v3 (AGPL-3.0).
  By running this app, you agree to its license terms.
- **Let's Encrypt**: By running NPMplus with Let's Encrypt, you agree to their Terms of Service.
- **HSTS**: If you enable HSTS for your domains, add them to the [HSTS preload list](https://hstspreload.org).

## Resources

- [NPMplus GitHub Repository](https://github.com/ZoeyVid/NPMplus)
- [NPMplus Docker Hub](https://hub.docker.com/r/zoeyvid/npmplus)
- [Nginx Proxy Manager (upstream)](https://github.com/NginxProxyManager/nginx-proxy-manager)
- [API Documentation](https://your-host:443/api/docs) — Swagger UI available at admin UI

## Logo

The `icon.png` used by this add-on is the official Nginx Proxy Manager logo,
sourced from the [NginxProxyManager/nginx-proxy-manager](https://github.com/NginxProxyManager/nginx-proxy-manager)
repository. All logo rights belong to the Nginx Proxy Manager contributors.

## License Attribution

NPMplus is distributed under the **GNU Affero General Public License v3 (AGPL-3.0)**.
It is based on the MIT-licensed [nginx-proxy-manager](https://github.com/NginxProxyManager/nginx-proxy-manager).
See the [NPMplus repository](https://github.com/ZoeyVid/NPMplus/blob/main/LICENSE) for full licensing details.

[version-shield]: https://img.shields.io/badge/version-0.1.1-blue.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io
[buymeacoffee-shield]: https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg
[buymeacoffee]: https://www.buymeacoffee.com/slopsynclabs
