hl.config({
    general = {
        gaps_in  = 1,
        gaps_out = 5,
        border_size = 1,
        col = {
            active_border   = "rgba(ffffff00)",
            inactive_border = "rgba(00000000)",
        },
        resize_on_border = true,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding           = 15,
        active_opacity     = 1,
        inactive_opacity   = 0.8,
        fullscreen_opacity = 1,

        blur = {
            enabled           = false,
            size              = 8,
            passes            = 3,
            new_optimizations = true,
            ignore_opacity    = false,
            xray              = true,
            popups            = true,
        },

        shadow = {
            enabled      = false,
            range        = 30,
            render_power = 3,
            color        = 0x66000000,
        },
    },
})
