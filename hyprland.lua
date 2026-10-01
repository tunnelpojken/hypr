-- ============================================================
--  hyprland.lua  —  Main entry point
--  ~/.config/hypr/hyprland.lua   (Hyprland 0.55+)
-- ============================================================

require("autostart")
require("looks")
require("input")
require("keybinds")
require("workspace")
require("permissions")
require("themes.active")

-- Active theme — swap the require() to change themes
require("themes/active")         -- LCL Deep Blue (Rei Ayanami)
-- require("themes/third-impact")   -- Dark Purple
-- require("themes/unit-01")        -- Violet/Green (Unit-01)

-- ~/.config/hypr/hyprland.lua
package.loaded["themes.active"] = nil
require("themes.active")

-- ── Monitors ───────────────────────────────────────────────
-- HDMI-A-1 is your MAIN screen (right side, origin 1920x0)
-- DP-2 is your SECONDARY screen (physically to the left, at 0x0)
hl.monitor({ output = "DP-2",     mode = "1920x1080@144", position = "0x0",    scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@144", position = "1920x0", scale = 1 })

-- ── Environment variables ──────────────────────────────────
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE",    "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_USE_PORTAL", "1")
hl.env("GDK_DEBUG", "portals")

hl.config({
    render = {
        direct_scanout = false,
    },
    xwayland = {
	enabled = true,
	use_nearest_neighbor = false,
        force_zero_scaling = true,
    },
})


-- For Noctalia Color templates
require("noctalia").apply_theme()
