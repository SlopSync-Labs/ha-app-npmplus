# Changelog

All notable changes to the NPMplus Home Assistant app will be documented here.

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
