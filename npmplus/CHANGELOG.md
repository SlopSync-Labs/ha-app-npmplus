# Changelog

All notable changes to the NPMplus app will be documented here.

## [0.1.1] - 2026-06-10

### Added

- Configuration options for Home Assistant:
  - `timezone` — timezone for NPMplus (required, defaults to UTC)
  - `acme_email` — email for Let's Encrypt certificate registration (optional)
  - `npm_port` — admin interface port (default 81, range 1024–65535)
  - `disable_http` — disable HTTP port 80, require HTTPS only (default false)
- `jq` dependency for parsing Home Assistant configuration JSON
- Documentation on initial access via HTTPS on port 81

### Fixed

- Docker build failure due to missing `/app/config` directory before creating symlink
- Environment variable handling for NPMplus startup (TZ, ACME_EMAIL, etc.)
- Admin interface port mapping in Dockerfile (expose port 81)

### Changed

- Simplified Dockerfile by removing unnecessary script initialization logic
- Updated README with configuration table and port documentation
- run.sh now reads Home Assistant options and exports as environment variables

---

## [0.1.0] - 2026-06-10

### Added

- Initial scaffold for the NPMplus Home Assistant app
- Uses official `zoeyvid/npmplus:latest` Docker image
- Ports: 80 (HTTP proxy), 81 (admin UI), 443 (HTTPS proxy + HTTP/3 UDP)
- Multi-arch support: `amd64`, `aarch64` (NPMplus does not support armv7, armhf, or i386)
- AGPL-3.0 license with proper attribution
- Repository manifest (`repository.yaml`)
- Root README with setup instructions
- App README with features, ports, and important notes
- Nginx Proxy Manager icon with attribution
- Badge shields (version, project stage, maintenance, community, donations)
- Let's Encrypt certificate storage mapped to `/ssl/npmplus` for HA shared SSL access
- `cont-init.d/01-ha-setup.sh` for directory initialization
