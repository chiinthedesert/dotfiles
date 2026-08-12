-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
  -- hl.exec_cmd("elephant")
  -- hl.exec_cmd("walker --gapplication-service")
  hl.exec_cmd("noctalia")
  hl.exec_cmd("fcitx -d")
  hl.dispatch(hl.dsp.focus({ workspace = 1 }))
end)
