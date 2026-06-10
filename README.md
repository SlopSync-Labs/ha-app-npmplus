# SlopSync Labs — NPMplus

The NPMplus Home Assistant app for advanced reverse proxying with HTTP/3, OIDC, and enterprise features.

NPMplus is an enhanced fork of [Nginx Proxy Manager](https://github.com/NginxProxyManager/nginx-proxy-manager)
maintained by [ZoeyVid](https://github.com/ZoeyVid/NPMplus).

## Adding This Repository to Home Assistant

1. Navigate to **Settings → App Store**
2. Click the menu (⋮) in the top-right and select **Repositories**
3. Add the following URL:

   ```text
   https://github.com/SlopSync-Labs/ha-app-npmplus
   ```

4. The NPMplus app will appear in your store

## ⚠️ Before Making Changes

We recommend using the [NPM Export Import](https://github.com/SlopSync-Labs/ha-app-npm-export-import)
app to export and back up all your NPMplus host settings before updates.

## Documentation

- [NPMplus App](./npmplus/README.md)

## Important Notes

- **Architecture**: Only amd64 and aarch64 are supported (not armv7, armhf, i386)
- **License**: NPMplus is distributed under AGPL-3.0
- **Ports**: Requires TCP 80, 443 and UDP 443 (for HTTP/3)
- **Timezone**: Required configuration - must be set in app options
- **Let's Encrypt**: Agree to their Terms of Service before using

## Resources

- [NPMplus GitHub](https://github.com/ZoeyVid/NPMplus)
- [NPMplus Docker Hub](https://hub.docker.com/r/zoeyvid/npmplus)
- [Nginx Proxy Manager (upstream)](https://github.com/NginxProxyManager/nginx-proxy-manager)

## License

AGPL-3.0 — see [LICENSE](./LICENSE)
