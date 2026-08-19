hl.on("hyprland.start", function()
  hl.exec_cmd("fcitx5-remove -r & fcitx5 -d --replace & fcitx5-remote -r")
  hl.exec_cmd("awww-daemon")
end
)
