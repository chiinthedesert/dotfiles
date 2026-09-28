------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

------------------
---- MONITORS ----
------------------

-- external monitor
hl.monitor({
  output = "HDMI-A-1",
  mode = "highres@highrr",
  position = "0x0",
  scale = 1,
})

-- internal monitor
local internal = {
  output = "eDP-1",
  mode = "highres@highrr",
  position = "auto-center-right",
  scale = 1.25,
}

hl.monitor(internal)

-- automatically manage the internal display
local function update_internal_monitor()
  local external_connected = hl.get_monitor("HDMI-A-1") ~= nil
  local internal_enabled = hl.get_monitor("eDP-1") ~= nil

  if external_connected and internal_enabled then
    -- external connected: disable internal
    hl.monitor({
      output = "eDP-1",
      disabled = true,
    })
  elseif not external_connected and not internal_enabled then
    -- external disconnected: enable internal
    hl.monitor(internal)
  end
end

-- when connecting or disconnecting the external monitor
hl.on("monitor.added", function(monitor)
  if monitor.name == "HDMI-A-1" then
    update_internal_monitor()
  end
end)

hl.on("monitor.removed", function(monitor)
  if monitor.name == "HDMI-A-1" then
    update_internal_monitor()
  end
end)

-- Handle an external monitor already connected at startup
hl.on("hyprland.start", update_internal_monitor)

-- Handle configuration reloads
hl.on("config.reloaded", update_internal_monitor)
