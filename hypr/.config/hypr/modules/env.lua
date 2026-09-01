-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("HYPRCURSOR_THEME", "Pokemon")
hl.env("HYPRCURSOR_SIZE", "32")
hl.env("XCURSOR_THEME", "Pokemon")
hl.env("XCURSOR_SIZE", "32")

hl.env("HYPRSHOT_DIR", "/home/chi/Pictures/Screenshots")

-- Qt
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Toolkit backends
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- Fcitx5 Input Method setup
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("INPUT_METHOD", "fcitx")
hl.env("SDL_IM_MODULE", "fcitx")

-- Firefox Wayland flag
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Electron Ozone Wayland hint
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
