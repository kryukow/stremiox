# Replica Recon — existing StremioX fork, iOS
This audit maps actual screens and reported defects; it is not a clean-room rebuild and does not copy proprietary content.
User: personal iPhone in Germany; Russian interface; no P2P.

Screens:
- S01 Home metadata catalog -> click film/series.
- S02 Detail -> hero image, year/rating/genres, season selector, episode cards. Reported portrait overflow.
- S03 Episode stream picker -> loading, ready, empty, per-addon errors. Screenshot shows no responding stream add-on.
- S04 MPV native player -> direct HTTP(S), audio/subtitle tracks, resume, error screens.
- S05 Add-ons -> search/installed capabilities, catalogs versus stream providers.
- S06 Settings -> forced Direct Links Only, Russian preferences, 4K/HDR player controls.
- S07 Paste direct link -> independent streaming sanity test.

Core flow F01: Home -> Series -> Season -> Episode -> Available legal HTTPS stream -> MPV -> Resume.
Core flow F02: Search -> Paste direct HLS link -> MPV -> Seek.
Core flow F03: switch orientation -> layout adapts.
Out of scope: free rights-protected movie catalog, paywall bypass, arbitrary translation of third-party editorial metadata, BitTorrent.

Inferred entities supported by reviewed source: CoreMetaItem; CoreVideo; CoreStream; CoreStreamSourceGroup; LastStreamStore; PlaybackMeta; ProfileStore.
