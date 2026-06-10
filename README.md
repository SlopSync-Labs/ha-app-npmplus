# SlopSync Labs — NPMplus

The NPMplus app for Home Assistant, maintained by [SlopSync-Labs](https://github.com/SlopSync-Labs).

NPMplus is an enhanced fork of Nginx Proxy Manager with advanced features including HTTP/3 (QUIC), OIDC authentication, mTLS support, CrowdSec integration, and more.

## Adding This Repository to Home Assistant

1. Navigate to **Settings → App Store**
2. Click the menu (⋮) in the top-right and select **Repositories**
3. Add the following URL:

   ```text
   https://github.com/SlopSync-Labs/ha-app-npmplus
   ```

4. The app will appear in your store

## ⚠️ Before Making Changes

We recommend using the [NPM Export Import](https://github.com/SlopSync-Labs/ha-app-npm-export-import) app to export and back up all your NPMplus host settings. This allows you to fully reinstate your configuration if anything goes wrong during updates or migrations.

## Documentation

- [NPMplus](./npmplus/README.md)

## Architecture Support

- **amd64** (x86-64-v2 and later)
- **aarch64** (ARM64)

> Note: armv7, armhf, and i386 are **not** supported by NPMplus.

## Important Notes

- **License**: NPMplus is distributed under the **GNU Affero General Public License v3 (AGPL-3.0)**. By running this app, you agree to the terms of the AGPL-3.0 license.
- **HTTP/3**: Remember to expose port 443 as both **TCP and UDP** for HTTP/3 (QUIC) support.
- **Let's Encrypt**: By running NPMplus with Let's Encrypt, you agree to their Terms of Service.
- **Ports**: Ensure ports 80 and 443 are free on your host. Disable Home Assistant's built-in nginx if it occupies these ports.

## Star History

[![Star History Chart](https://api.star-history.com/chart?repos=SlopSync-Labs/ha-app-npmplus&type=date&legend=top-left)](https://www.star-history.com/?repos=SlopSync-Labs%2Fha-app-npmplus&type=date&legend=top-left)

## License

AGPL-3.0 — see [LICENSE](./LICENSE)
