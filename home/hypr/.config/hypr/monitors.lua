hl.monitor({
  output   = "DP-6",
  mode     = "2560x1440@160",
  position = "0x0",
  scale    = "auto",
})

hl.monitor({
  output    = "DP-5",
  mode      = "2560x1440@60",
  position  = "auto-center-left",
  scale     = "auto",
  transform = 1
})

hl.monitor({
  output    = "DP-4",
  mode      = "3840x2160@60",
  position  = "auto-center-right",
  scale     = "auto",
  transform = 3
})
