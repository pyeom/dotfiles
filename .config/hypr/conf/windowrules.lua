-- Layer rules
hl.layer_rule({
    name         = "rofi-blur",
    match        = { namespace = "rofi" },
    blur         = true,
    ignore_alpha = 0.5,
    animation    = "slide",
})

hl.layer_rule({
    name         = "waybar-blur",
    match        = { namespace = "waybar" },
    blur         = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name         = "swaync-cc-blur",
    match        = { namespace = "swaync-control-center" },
    blur         = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name         = "swaync-notif-blur",
    match        = { namespace = "swaync-notification-window" },
    blur         = true,
    ignore_alpha = 0.5,
})

-- Window rules
hl.window_rule({
    name  = "pavucontrol-float",
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
    size  = "monitor_w*0.6 monitor_h*0.4",
})

hl.window_rule({
    name  = "blueman-float",
    match = { class = "blueman-manager" },
    float = true,
})

hl.window_rule({
    name  = "nm-editor-float",
    match = { class = "nm-connection-editor" },
    float = true,
})

hl.window_rule({
    name  = "nmtui-float",
    match = { class = "nmtui" },
    float = true,
})

hl.window_rule({
    name    = "firefox-no-blur",
    match   = { class = "firefox" },
    no_blur = true,
})

hl.window_rule({
    name    = "vscode-no-blur",
    match   = { class = "Code" },
    no_blur = true,
})

hl.window_rule({
    name  = "jetbrains-float",
    match = { class = "jetbrains-studio" },
    float = true,
})

hl.window_rule({
    name  = "emulator-float",
    match = { class = "Emulator" },
    float = true,
})

hl.window_rule({
    name  = "steam-float",
    match = { class = "steam" },
    float = true,
})

hl.window_rule({
    name  = "steam-friends-float",
    match = { class = "steam", title = "Friends List" },
    float = true,
})

hl.window_rule({
    name  = "gamescope-float",
    match = { class = "gamescope", title = "fellowship" },
    float = true,
})

hl.window_rule({
    name      = "discord-ws",
    match     = { class = "discord" },
    workspace = "2 silent",
})

hl.window_rule({
    name      = "elecwhat-ws",
    match     = { class = "elecwhat" },
    workspace = "3 silent",
})

hl.window_rule({
    name  = "librepods-float",
    match = { class = "me.kavishdevar.librepods" },
    float = true,
})

hl.window_rule({
    name           = "suppress-maximize",
    match          = { class = ".*" },
    suppress_event = "maximize",
})
