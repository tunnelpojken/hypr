-- ============================================================
--  themes/active.lua  —  LCL Deep Blue  (Rei Ayanami)
--  Icy cyan gradient borders
-- ============================================================

hl.config({
    general = {
        col = {
            active_border   = { colors = { "rgba(7ee8e8ff)", "rgba(3fa8b8ff)" }, angle = 45 },
            inactive_border = "rgba(1e4f5aaa)",
        },
    },

    group = {
        col = {
            border_active        = "rgba(7ee8e8ff)",
            border_inactive      = "rgba(1e4f5aaa)",
            border_locked_active = "rgba(3fa8b8ff)",
        },
    },
})
