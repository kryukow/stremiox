# Replica QA — StremioX Direct (iOS, Germany)
Observed 2026-10-11, supplied portrait and landscape screenshots.

| ID | Sev | Evidence and root cause | Fix status |
| --- | --- | --- | --- |
| R-01 | S2 | Detail page expands beyond portrait width. Original image and horizontal action buttons request more than viewport. Screenshots: East of Eden / MobLand. | Candidate code fixes c66b02f + 1c6e471 compiled; needs device screenshot confirmation. |
| R-02 | S2 | "No stream add-ons responded for this title" when opening Brothers. Metadata/catalog works but no responding addon providing direct playable video. | Not a codec/HDR error; check Add-ons and test direct HLS. Cannot invent source. |
| R-03 | S3 | English UI in screenshot at 15:16. | Russian build was made later than screenshot; install latest Direct IPA and verify. |
| R-04 | S2 | Auto-next episode: native iOS PlayerScreen supports callbacks but episode view does not wire hasNext/onNext. | Separate implementation and testing required. |
| R-05 | S2 | Streaming legality in Germany. Removing P2P does not make an unlicensed HTTPS source lawful. | Forced no-P2P build remains; use public demo or licensed streams for tests. |

Only R-01 to R-03 are directly evidenced by user screenshots; R-04 confirmed by source inspection, not on-device. Do not mark playback operational until direct HLS demo is observed running on the iPhone.
