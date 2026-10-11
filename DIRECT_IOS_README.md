# StremioX Direct for iPhone (no on-device torrents)

This is an experimental **P2P-free iOS build** based on the original [StremioX](https://github.com/yvdjee/stremiox) source (GPL-3.0).

## What is different

The `StremioXiOSDirect` XcodeGen target in `app/project-direct-only.yml` deliberately **does not compile or bundle**:

- `Sources/NodeServer.swift` (embedded streaming server launcher)
- `NodeMobile.xcframework` (Node runtime)
- `Resources/server.js` (torrent streaming server)

The compile flag `STREMIOX_NO_EMBEDDED_SERVER` enables the upstream app's **forced Direct Links Only** logic: torrent URLs have no playable endpoint and magnet links are refused. The source list hides torrent streams. The workflow verifies that server assets are not packaged.

**Capabilities retained:** native iOS interface, MPV player, direct HTTP/HTTPS video streams, selected audio and subtitle tracks, account and Continue Watching progress. Actual 4K/HDR and Russian audio depend on media source and player/device support.

**Trade-off:** streams that require Stremio's embedded HTTP proxy (custom headers or certain CDNs) may not work without the bundled server. This is preferable to quietly adding the torrent runtime back.

## Build

1. GitHub Actions → **Build iPhone Direct (no torrents)** (triggered by commits to the workflow/spec on the working branch).
2. Wait until it is **green**.
3. Download artifact **StremioX-Direct-iOS-unsigned**. It contains an unsigned IPA and SHA256SUMS.
4. Sign/install the IPA with your chosen sideloading method (AltStore/Sideloadly). Merely downloading the artifact does not install it.

The build uses a macOS GitHub runner, builds the *iPhone-only* Rust static core, and uses the GPL MPVKit package. Its bundled libraries must be reviewed before distribution.

## Known limitations

- **Next-episode autoplay:** upstream `PlayerScreen` supports `onNext`, but the iOS episode presenter does not yet pass a next-episode callback. This requires separate implementation and on-device testing.
- The project and CI are experimental until the macOS runner completes an actual build and the app is tested on the phone.
- This project does **not** include movies, catalog add-ons or a film source; it does not bypass subscriptions.
- Disabling P2P reduces exposure to file-sharing allegations but **does not make unlicensed streaming lawful in Germany**.
- Preserve all GPL-3.0 licensing obligations and third-party notices if redistributing this derivative.
