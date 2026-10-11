# Replica Test — iOS Direct acceptance plan

F01 portrait details:
- F01-H1 [S2] With iPhone portrait widths 320 / 375 / 393 / 430 pt: title, logo, play, trailer, library button and episode text stay inside safe area.
- F01-E1 [S2] Rotate portrait-landscape-portrait without truncation, unwanted horizontal shift or lost episode selection.
- F01-E2 [S3] Test Dynamic Type larger text and unusually long titles.

F02 direct playback:
- F02-H1 [S1] Search -> "Play a direct link" -> enter public Mux HLS sample https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8 -> video/audio play and seek.
- F02-E1 [S2] No stream addons configured: report missing source, do not show invented streams.
- F02-E2 [S2] Add-on returns no direct URL or only infoHash: show empty results without trying any P2P.
- F02-E3 [S2] Test offline, broken HTTPS, header-gated CDN and protected DRM stream; show a useful error, not a fake success.

F03 localization:
- F03-H1 [S2] Install latest Russian IPA: Home, Search, Discover, Library, Add-ons, Settings and MPV actions are in Russian.
- F03-E1 [S3] English synopsis and series titles from upstream metadata should remain unmodified; do not claim translation of movie metadata.
- F03-E2 [S3] Russian language default for audio/subtitles unless user previously selected another language.

F04 continuity:
- F04-H1 [S2] Save timestamp, reopen same episode, resume from exact position.
- F04-H2 [S2] Automatic next episode currently NOT connected; keep as open bug until added and tested.

F05 Germany and no-P2P:
- F05-H1 [S1] Build flag STREMIOX_NO_EMBEDDED_SERVER active, no NodeMobile or server.js in IPA.
- F05-H2 [S1] All playback tests use authorized legal streams, never unauthorized torrent or paywall bypass.

Acceptance gate: GitHub Actions green verifies a compilable IPA, not on-device fit or actual playback. Require screenshots of portrait detail and a successful public HLS sample on the iPhone.
