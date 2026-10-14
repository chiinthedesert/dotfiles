-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
  hl.dispatch(hl.dsp.focus({ workspace = 1 }))
  hl.exec_cmd("/usr/lib/mate-polkit/polkit-mate-authentication-agent-1")
  hl.exec_cmd("fcitx5 -d")
  hl.exec_cmd("kanata -c ~/.config/kanata/simple.kbd")
  hl.exec_cmd("otd-daemon")

  hl.exec_cmd("swaync")
  hl.exec_cmd("swayosd-server")

  hl.exec_cmd("qs -c tray")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
