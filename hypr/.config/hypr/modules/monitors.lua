------------------
---- MONITORS ----
------------------

local external = "HDMI-A-1"
local internal = "eDP-1"

-- true: keep both screens on
-- false: disable laptop screen when external is connected
local dual_monitor = false

hl.monitor({
  output = external,
  mode = "highres@highrr",
  position = "0x0",
  scale = 1,
})

local function internal_config(disabled)
  return {
    output = internal,
    mode = "highres@highrr",
    position = "auto-center-right",
    scale = 1.25,
    disabled = disabled,
  }
end

local function disable_internal()
  if not dual_monitor and hl.get_monitor(internal) ~= nil then
    hl.monitor({
      output = internal,
      disabled = true,
    })
  end
end

local function enable_internal()
  if hl.get_monitor(internal) == nil then
    hl.monitor(internal_config(false))
  end
end

-- Initial state
hl.monitor(internal_config(not dual_monitor and hl.get_monitor(external) ~= nil))

-- External plugged in
hl.on("monitor.added", function(monitor)
  if monitor.name == external then
    if dual_monitor then
      enable_internal()
    else
      disable_internal()
    end
  end
end)

-- External unplugged
hl.on("monitor.removed", function(monitor)
  if monitor.name == external then
    enable_internal()
  end
end)
