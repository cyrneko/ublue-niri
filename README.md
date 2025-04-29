# ublue-niri &nbsp; [![bluebuild build badge](https://github.com/cyrneko/ublue-niri/actions/workflows/build.yml/badge.svg)](https://github.com/cyrneko/ublue-niri/actions/workflows/build.yml)

This is my personal Universal Blue image, including things like Niri, Greetd, Ironbar...

> **Warning**  
> This image is highly experimental and comes loaded with my configuration. If you want an image without my configuration please .

To rebase an existing atomic Fedora installation to the latest build:

- Rebase using this command:
  ```bash
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/cyrneko/ublue-niri:latest
  # for configless:
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/cyrneko/ublue-niri-noconfig:latest
  ```
- Reboot to complete the rebase:
  ```bash
  systemctl reboot
  # or just 'reboot'
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/cyrneko/ublue-niri
```
