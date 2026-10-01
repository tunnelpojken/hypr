-- ============================================================
--  keybinds.lua
-- ============================================================

local mainMod = "SUPER"
local terminal    = "kitty"
local fileManager = "kitty -e yazi"
local ipc	= "noctalia msg"
local terminal	= "kitty"
local browser	= "firefox"
local discord	= "discord"
local steam	= "steam"
local taskmanager = "kitty -e btop"


-- ── App launchers ──────────────────────────────────────────
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(discord))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(steam))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(taskmanager))

-- ── Window management ──────────────────────────────────────
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))  -- dwindle only

-- Exit: prefer hyprshutdown if installed, fall back to built-in exit
hl.bind(mainMod .. " + M + N", hl.dsp.exec_cmd(
    "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
))

-- ── Focus movement ─────────────────────────────────────────
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down"  }))

-- ── Workspace switching 1-10 ───────────────────────────────
-- NOTE: On Swedish layout, number keys use their unmodified names.
-- Key 0 maps to workspace 10 via i % 10 trick.
for i = 1, 10 do
    local key = i % 10   -- 10 → key "0"
    hl.bind(mainMod .. " + " .. key,                hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- ── Scroll through workspaces with SUPER + SHIFT + scroll ─
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up",   hl.dsp.focus({ workspace = "e+1" }))

-- ── Move/resize windows with mouse ────────────────────────
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ── Scrolling layout controls ──────────────────────────────
hl.bind(mainMod .. " + bracketleft",  hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + bracketright", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + mouse_up",     hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + mouse_down",   hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + SHIFT + R",    hl.dsp.layout("colresize +conf"))

-- ── Audio & brightness ─────────────────────────────────────
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),       { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),      { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- ── Media playback ─────────────────────────────────────────
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- ── Noctalia binds  ─────────────────────────────────────────
hl.bind(mainMod .. " + A",     hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind(mainMod .. " + G",     hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(ipc .. " settings-toggle"))


-- ── Good to have binds  ─────────────────────────────────────────
-- Theme picker overlay (SUPER+W — Wardrobe)
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("bash /home/fested/.config/hypr/scripts/theme-picker.sh"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("bash -c 'grimblast copysave area ~/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png'"))



-- PoE2 Trade

hl.bind("CTRL + d", hl.dsp.exec_cmd("hyprctl dispatch sendshortcut CTRL,d,class:^(exiled-exchange-2)$"))
hl.bind("ALT + e", hl.dsp.exec_cmd("hyprctl dispatch sendshortcut ALT,e,class:^(exiled-exchange-2)$"))


