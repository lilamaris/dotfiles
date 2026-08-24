-- HiDPI: 4K (DP-4) + 2x 1440p (DP-5, DP-6).
-- Scales are pinned explicitly instead of "auto":
--   * "auto" is derived from the EDID physical size, so it can silently change
--     between boots / cables, which is a classic cause of a suddenly "broken"
--     4K look in mixed-resolution setups.
--   * DP-4 stays at 1.5 (what auto resolved to anyway): it renders 3840x2160 as
--     1440x2560 virtual, exactly matching the rotated 1440p panel next to it,
--     while the extra pixel density keeps text crisp. 1.5 is also a known-good
--     scale for Electron apps like Obsidian (they render correctly on 1.0 / 1.5 / 2.0,
--     but can break on odd fractional values).
--   * If some app (mainly XWayland apps) ever still looks soft, raise DP-4 to
--     scale = 2.0 (integer scale = zero resampling, virtual 1080x1920).
hl.monitor({
  output   = "DP-6",
  mode     = "2560x1440@160",
  position = "0x0",
  scale    = 1,
})

hl.monitor({
  output    = "DP-5",
  mode      = "2560x1440@60",
  position  = "auto-center-left",
  scale     = 1,
  transform = 1
})

hl.monitor({
  output    = "DP-4",
  mode      = "3840x2160@60",
  position  = "auto-center-right",
  scale     = 1.5,
  transform = 3
})
