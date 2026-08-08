local terminal = "kitty"
local menu     = "noctalia msg panel-toggle launcher"

---------------------
---- KEYBINDINGS ----
---------------------
local mod      = "SUPER"

hl.bind(mod .. "+ Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. "+ F", hl.dsp.window.fullscreen())
hl.bind(mod .. "+ Q", hl.dsp.window.close())
hl.bind(mod .. "+ SHIFT + E", hl.dsp.exit())
-- hl.bind(mod .. "+ E", hl.dsp.exec_cmd("kitty -e yazi"))
hl.bind(mod .. "+ V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. "+ Space", hl.dsp.exec_cmd(menu))
hl.bind(mod .. "+ P", hl.dsp.window.pseudo())
-- hl.bind(mod .. "+ semicolon", hl.dsp.layout.("togglesplit"))

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mod .. "+ PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

hl.bind(mod .. "+ N", hl.dsp.exec_cmd("hyprsunset -t 4500 -g 70%"))
hl.bind(mod .. "+ SHIFT + N", hl.dsp.exec_cmd("pkill hyprsunset"))
hl.bind(mod .. "+ SHIFT + C", hl.dsp.exec_cmd("hyprshade toggle grayscale"))

hl.bind(mod .. "+ H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. "+ L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. "+ K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. "+ J", hl.dsp.focus({ direction = "down" }))

for i = 1, 9 do
  hl.bind(mod .. "+ " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. "+ SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. "+ S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. "+ SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))


hl.bind(mod .. "+ mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. "+ mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("sh -c 'ddcutil --bus 2 setvcp 0x10 + 5; brightnessctl s 5%+'"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("sh -c 'ddcutil --bus 2 setvcp 0x10 - 5; brightnessctl s 5%-'"))

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
