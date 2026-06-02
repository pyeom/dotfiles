hl.config({ animations = { enabled = true } })

hl.curve("myBezier", { type = "bezier", points = { {1, 0.5}, {0.16, 1.3} } })
hl.curve("linear",   { type = "bezier", points = { {0, 0},   {1, 1}     } })

hl.animation({ leaf = "windows",          enabled = true, speed = 4,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 5,  bezier = "default",  style = "popin 80%" })
hl.animation({ leaf = "border",           enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle",      enabled = true, speed = 60, bezier = "linear",   style = "loop" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2,  bezier = "default" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 5,  bezier = "default" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 6,  bezier = "default",  style = "slidefadevert +50%" })
