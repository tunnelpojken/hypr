-- ============================================================
--  autostart.lua
-- ============================================================

hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("nvibrant 0 0 500 0 0 0 0 0")
    hl.timer(function()
hl.exec_cmd([[
            ACTIVE_THEME=$(cat ~/.config/themes/active-name.txt 2>/dev/null || echo "rei-ayanami")
            THEME_DIR="$HOME/.config/themes/$ACTIVE_THEME"
            
            # Check for live video wallpaper on HDMI-A-1, fallback to static PNG
            if [ -f "$THEME_DIR/live.mp4" ]; then
                mpvpaper --fork -o "no-audio loop" HDMI-A-1 "$THEME_DIR/live.mp4"
            elif [ -f "$THEME_DIR/wp1.png" ]; then
                awww img --outputs HDMI-A-1 "$THEME_DIR/wp1.png"
            fi

            # Set static wallpaper on DP-2
            if [ -f "$THEME_DIR/wp2.png" ]; then
                awww img --outputs DP-2 "$THEME_DIR/wp2.png"
            fi
        ]])
    end, { timeout = 1000, type = "oneshot" })
end)
