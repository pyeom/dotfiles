-- Cursor (was cursor.conf)
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE",  "12")

-- XDG Desktop Portal
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE",    "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- GTK
hl.env("GDK_SCALE", "1")
hl.env("GTK_THEME", "Adwaita:dark")

-- Mozilla
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- AppImage
hl.env("APPIMAGELAUNCHER_DISABLE", "1")

-- Ozone (Electron/Chromium)
hl.env("OZONE_PLATFORM",               "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "discord")
