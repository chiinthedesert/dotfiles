------------------
---- MONITORS ----
------------------

local external = "HDMI-A-1"
local internal = "eDP-1"

-- external monitor
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

-- On config load/reload, preserve the correct state immediately.
--
-- External already active -> internal starts disabled.
-- No external             -> internal starts enabled.
hl.monitor(internal_config(hl.get_monitor(external) ~= nil))

local function disable_internal()
  -- Don't re-disable an already disabled monitor.
  if hl.get_monitor(internal) ~= nil then
    hl.monitor({
      output = internal,
      disabled = true,
    })
  end
end

local function enable_internal()
  -- Don't re-enable an already enabled monitor.
  if hl.get_monitor(internal) == nil then
    hl.monitor(internal_config(false))
  end
end

-- External plugged in -> laptop display off.
hl.on("monitor.added", function(monitor)
  if monitor.name == external then
    disable_internal()
  end
end)

-- External unplugged -> laptop display back on.
hl.on("monitor.removed", function(monitor)
  if monitor.name == external then
    enable_internal()
  end
end)
