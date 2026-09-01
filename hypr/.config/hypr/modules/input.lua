---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout    = "us",
    kb_variant   = "",
    kb_model     = "",
    kb_options   = "",
    kb_rules     = "",

    follow_mouse = 1,

    sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad     = {
      natural_scroll = true,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
  name        = "razer-razer-deathadder-essential-1",
  sensitivity = -0.6,
  -- accel_profile = "flat"
})
hl.device({
  name        = "razer-razer-deathadder-essential",
  sensitivity = -0.6,
  -- accel_profile = "flat"
})
hl.device({
  name        = "logitech-usb-receiver-mouse",
  sensitivity = -0.2,
  -- accel_profile = "flat"
})
