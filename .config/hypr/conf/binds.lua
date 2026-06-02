local mainMod     = "SUPER"
local terminal    = "alacritty"
local fileManager = "dolphin"
local calculator  = "GTK_THEME=Adwaita-dark gnome-calculator"
local menu        = "rofi -show drun"

-- Applications
hl.bind(mainMod .. " + Q",  hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + M",  hl.dsp.exit())
hl.bind(mainMod .. " + B",  hl.dsp.window.close())
hl.bind(mainMod .. " + E",  hl.dsp.exec_cmd(fileManager))
hl.bind("F12",              hl.dsp.exec_cmd(calculator))
hl.bind(mainMod .. " + V",  hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R",  hl.dsp.exec_cmd("$(pidof -q rofi) && pkill rofi || " .. menu))
hl.bind(mainMod .. " + P",  hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",  hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F",  hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + L",  hl.dsp.exec_cmd("hyprlock"))

-- Focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspaces (key 0 maps to workspace 10)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move window
hl.bind("ALT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind("ALT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("ALT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind("ALT + down",  hl.dsp.window.move({ direction = "down" }))

-- Screenshots
hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"))
hl.bind("Print",        hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("ALT + Print",  hl.dsp.exec_cmd("hyprshot -m active -m output --clipboard-only"))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse drag / resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Audio (pactl)
hl.bind("F1", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("F2", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind("F3", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("F4", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))

-- Brightness
hl.bind("F5", hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind("F6", hl.dsp.exec_cmd("brightnessctl set 5%+"))

-- Custom scripts
hl.bind("ALT + TAB", hl.dsp.exec_cmd("~/.config/waybar/power-menu.sh"))
hl.bind("ALT + p",   hl.dsp.exec_cmd("~/.config/waybar/music-player.sh"))
hl.bind("ALT + w",   hl.dsp.exec_cmd("~/.config/hypr/wallpaper.sh"))
hl.bind("ALT + a",   hl.dsp.exec_cmd("~/.config/waybar/refresh.sh"))
hl.bind("ALT + r",   hl.dsp.exec_cmd("~/.config/swaync/refresh.sh"))

-- Virtual keyboard
hl.bind("ALT + k",         hl.dsp.exec_cmd("~/.config/wvkbd/toggle.sh"))
hl.bind("ALT + SHIFT + k", hl.dsp.exec_cmd("~/.config/wvkbd/reload.sh"))

-- Lid switch (locked = works on lock screen)
hl.bind("switch:on:Lid Switch",  hl.dsp.exec_cmd("hyprctl dispatch dpms off"), { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl dispatch dpms on"),  { locked = true })
