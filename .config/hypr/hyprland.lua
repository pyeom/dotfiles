-- https://wiki.hypr.land/Configuring/Start/
-- NOTE: pywal colors-hyprland was sourced here but used no active color vars.
--       To restore dynamic colors, have pywal generate a colors-hyprland.lua template.

require("conf.monitors")
require("conf.environment")
require("conf.keyboard")
require("conf.autostart")
require("conf.animations")
require("conf.window")
require("conf.layout")
require("conf.misc")
require("conf.binds")
require("conf.windowrules")
require("conf.gestures")

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
