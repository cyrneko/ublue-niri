# ublue-niri &nbsp; [![bluebuild build badge](https://github.com/cyrneko/ublue-niri/actions/workflows/build.yml/badge.svg)](https://github.com/cyrneko/ublue-niri/actions/workflows/build.yml)

This is my personal Universal Blue image, including things like Niri, Greetd

> **Warning**  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- Rebase using this command:
  ```bash
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/cyrneko/ublue-niri:latest
  ```
- Reboot to complete the rebase:
  ```bash
  systemctl reboot
  # or just 'reboot'
  ```
<details>
<summary>optionally rebase to signed images</summary>
- Then rebase to the signed image, like so:
  ```bash
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/cyrneko/ublue-niri:latest
  ```
- Reboot again to complete the installation
  ```bash
  systemctl reboot
  ```
</details>

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

<!-- ## ISO -->
<!--  -->
<!-- If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting. -->

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/cyrneko/ublue-niri
```
