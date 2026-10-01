-- ============================================================
--  looks.lua  —  Visual / layout configuration
--  Border colours are set by the active theme (themes/active.lua)
-- ============================================================

hl.config({
    general = {
        gaps_in          = 5,
        gaps_out         = 10,
        border_size      = 2,
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "scrolling",
    },

    scrolling = {
        follow_focus             = false,
        follow_min_visible       = 1,
        fullscreen_on_one_column = false,
    },

    group = {
        groupbar = {
            text_color = "rgba(f8f9faff)",
        },
    },

    decoration = {
        rounding        = 35,
        rounding_power  = 1,
        active_opacity  = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 2,
            render_power = 3,
            color        = "rgba(ff84c3a2)",
        },

        blur = {
            enabled  = true,
            size     = 4,
            passes   = 2,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        background_color        = "rgb(1a1b26)",
        force_default_wallpaper = 0,
    },
})

-- ── Curves ─────────────────────────────────────────────────
-- Custom bezier: fluid, deliberate, calm — named after Rei
hl.curve("reiCalm", { type = "bezier", points = { {0.3, 0.0}, {0.2, 1.0} } })

-- ── Animations ─────────────────────────────────────────────
hl.animation({ leaf = "windows",     enabled = true, speed = 5,  bezier = "reiCalm", style = "slide" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 5,  bezier = "reiCalm", style = "slide" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "reiCalm", style = "slidefade 20%" })


-- Opacities

hl.window_rule({ match = { class = "^(discord)$" },          opacity = "0.90 0.90" })
hl.window_rule({ match = { class = "^(steam)$" },            opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "^(kitty)$" },            opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "^(kitty-dropterm)$" },   opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "^(youtube-music)$" },    opacity = "0.80 0.80" })


-- Window position
-- Move Discord to Workspace 2 (only when it initially launches)
hl.window_rule({ match = { class = "^(discord)$" }, workspace = "3 silent" })
hl.window_rule({ match = { class = "^(steam)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(steam_app_.*)$" }, workspace = "1 silent" })
hl.window_rule({ match = { class = "^(starcitizen.exe)$" }, workspace = "1 silent" })
hl.window_rule({ match = { class = "^(rsi launcher.exe)$" }, workspace = "1 silent" })


-- Optional: Make them persistent so they don't disappear when empty
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "DP-2", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "DP-2", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "DP-2", persistent = true })



-- Yazi file chooser

hl.window_rule({ match = { class = "^(file_chooser)$" }, float = true })
hl.window_rule({ match = { class = "^(file_chooser)$" }, center = true })
hl.window_rule({ match = { class = "^(file_chooser)$" }, size = "1000 650" })


-- Noctalia V5 blur



-- Window rule exiled exchange 2
hl.window_rule({
    name = "exiled-exchange",
    match = { class = "^(exiled-exchange-2)$" },
    no_blur = true,
})


