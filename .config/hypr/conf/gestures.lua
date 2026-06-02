hl.config({
    gestures = {
        workspace_swipe_create_new = false,
        workspace_swipe_invert     = true,
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- 3-finger up: toggle special workspace
