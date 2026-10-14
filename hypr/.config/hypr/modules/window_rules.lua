--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- see https://wiki.hypr.land/configuring/basics/window-rules/
-- and https://wiki.hypr.land/configuring/basics/workspace-rules/

for i = 1, 6 do
  hl.workspace_rule({
    workspace = tostring(i),
    monitor = "HDMI-A-1",
    default = (i == 1),
    persistent = true,
  })
end

-- hl.workspace_rule({
--   workspace = "7",
--   monitor = "edp-1",
--   default = true,
--   persistent = true,
-- })

-- example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name = "suppress-maximize-events",
  match = { class = ".*" },

  suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },

  no_focus = true,
})

-- layer rules also return a handle.
-- local overlaylayerrule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlaylayerrule:set_enabled(false)

-- hyprland-run windowrule
hl.window_rule({
  name = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move = "20 monitor_h-120",
  float = true,
})

-- pyqt6 floating
hl.window_rule({
  match = {
    initial_title = "Figure.*",
  },
  float = true,
  center = true,
  size = { 900, 650 },
})
