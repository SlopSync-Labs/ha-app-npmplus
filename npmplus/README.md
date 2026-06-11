# NPMplus

![Version][version-shield]
![Project Stage][project-stage-shield]
![Maintained][maintenance-shield]

[![Community Forum][forum-shield]][forum]
[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

Enhanced reverse proxy manager with HTTP/3 (QUIC), OIDC, mTLS, and advanced security features.

This Home Assistant app runs the latest [zoeyvid/npmplus](https://github.com/ZoeyVid/NPMplus) image,
a feature-rich fork of [nginx-proxy-manager](https://github.com/NginxProxyManager/nginx-proxy-manager).

## Features

- Free SSL certificates via Let's Encrypt (HTTP-01 and DNS-01 challenges)
- Reverse proxy with custom locations, websocket support, and access lists
- Redirect and 404 hosts
- Beautiful admin UI with HTTPS security
- HTTP/3 (QUIC) support for modern browsers
- OIDC authentication integration
- mTLS support with custom CA certificates
- CrowdSec and OpenAppSec integration
- Goaccess analytics dashboard
- ACME profile support
- Enhanced privacy (local Gravatar caching, local QR code generation)
- PHP and file server support

## Ports

| Port | Protocol | Description |
| --- | --- | --- |
| 80 | TCP | HTTP proxy traffic |
| 81 | TCP | Admin UI (HTTPS) |
| 443 | TCP | HTTPS proxy traffic |
| 443 | UDP | HTTP/3 (QUIC) |

**⚠️ Important**: Port 443 must be exposed as **both TCP and UDP** to support HTTP/3.

## Configuration

### Required Settings

| Option | Description | Default |
| --- | --- | --- |
| `timezone` | Timezone for NPMplus (e.g., UTC, America/New_York) | UTC |

### Optional Settings

| Option | Description | Default |
| --- | --- | --- |
| `acme_email` | Email for Let's Encrypt certificate registration | (empty) |

## Initial Access

After the app starts, open the admin UI at `https://<your-ha-ip>:81` and follow the
onboarding flow. Default credentials are documented in the [NPMplus repository](https://github.com/ZoeyVid/NPMplus).

## Data Persistence

NPMplus configuration and database are stored in the `/data` directory and persist across restarts.

Let's Encrypt certificates are stored at `/ssl/npmplus`, which is Home Assistant's shared SSL directory.
This makes certificates accessible to other HA apps that map the `ssl` volume.

## Architecture Support

**Supported:**

- amd64 (x86-64-v2 and later)
- aarch64 (ARM64)

**Not supported:**

- armv7, armhf, i386, and other 32-bit architectures

## Important Notes

- **License**: NPMplus is distributed under the GNU Affero General Public License v3 (AGPL-3.0)
- **Let's Encrypt**: By running NPMplus with Let's Encrypt, you agree to their Terms of Service
- **Port conflicts**: Ensure ports 80 and 443 are free. Disable Home Assistant's built-in nginx if needed
- **HSTS**: If you enable HSTS for your domains, add them to the [HSTS preload list](https://hstspreload.org)
- **QUIC/UDP**: Remember to expose UDP on port 443 for HTTP/3 support
- **Backup**: Before major updates, use the NPM Export Import app to backup your configuration

## Resources

- [NPMplus GitHub](https://github.com/ZoeyVid/NPMplus)
- [NPMplus Docker Hub](https://hub.docker.com/r/zoeyvid/npmplus)
- [Nginx Proxy Manager (upstream)](https://github.com/NginxProxyManager/nginx-proxy-manager)
- [API Documentation](https://your-host:81/api/docs)

## License

NPMplus is distributed under the GNU Affero General Public License v3 (AGPL-3.0).
By running this app, you agree to its license terms. See the
[NPMplus repository](https://github.com/ZoeyVid/NPMplus/blob/main/LICENSE) for details.

[version-shield]: https://img.shields.io/badge/version-0.1.3-blue.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io
[buymeacoffee-shield]: https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg
[buymeacoffee]: https://www.buymeacoffee.com/slopsynclabs
