-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	-- hl.exec_cmd("elephant")
	-- hl.exec_cmd("walker --gapplication-service")
	hl.exec_cmd("noctalia")
	hl.dispatch(hl.dsp.focus({ workspace = 1 }))
	hl.exec_cmd("/usr/lib/mate-polkit/polkit-mate-authentication-agent-1")
	hl.exec_cmd("otd-daemon")
	hl.exec_cmd("otd-gui --background")
end)
