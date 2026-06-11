# Changelog

All notable changes to the NPMplus Home Assistant app will be documented here.

## [0.1.4] - 2026-06-11

### Fixed

- Add nginx configuration maps for X-Forwarded-Proto and X-Forwarded-Host headers
- Improve proxy header handling to ensure headers are properly passed through nginx to backend
- Enhanced support for external reverse proxy setups (e.g., NAS proxy servers)

---

## [0.1.3] - 2026-06-11

### Fixed

- Fix redirect loop when accessed through external reverse proxies by enabling proxy header trust
- Allow X-Forwarded-Proto and X-Forwarded-Host headers from upstream proxies (e.g., NAS proxy servers)

---

## [0.1.2] - 2026-06-10

### Fixed

- Fix app shutdown error by using s6-overlay directly instead of run.sh wrapper
- Proper signal handling for clean container shutdown

---

## [0.1.1] - 2026-06-10

### Fixed

- Fix redirect loop when accessing admin UI by changing webui from HTTPS to HTTP
- Simplify config.json schema to match working app pattern
- Simplify Dockerfile to use CMD pattern instead of cont-init.d

---

## [0.1.0] - 2026-06-10

### Added

- Initial release of NPMplus Home Assistant app
- Support for amd64 and aarch64 architectures
- Configuration options:
  - `timezone` (required) — timezone for NPMplus
  - `acme_email` (optional) — email for Let's Encrypt registration
- Port mappings for HTTP (80), HTTPS (443 TCP+UDP), and admin UI (81)
- Let's Encrypt certificate storage mapped to HA's shared `/ssl/npmplus` directory
- Home Assistant initialization script using s6-overlay pattern
- Documentation with feature overview and configuration guide
- AGPL-3.0 license compliance

### Fixed

- Architecture restrictions — only amd64 and aarch64 supported (NPMplus limitation)
- Proper admin UI port (81) with HTTPS
- HTTP/3 (QUIC) port configuration (UDP 443)
