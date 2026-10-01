#!/usr/bin/env bash
export LC_ALL=C.UTF-8
THEMES_DIR="$HOME/.config/themes"
ACTIVE_MARKER="$THEMES_DIR/active-name.txt"
RASI="$HOME/.config/hypr/scripts/theme-grid.rasi"
MENU_ENTRIES=""
for dir in "$THEMES_DIR"/*/; do
    [ -d "$dir" ] || continue
    theme_name=$(basename "$dir")
    preview="$dir/preview.png"
    [ ! -f "$preview" ] && preview="$dir/wp1.png"
    MENU_ENTRIES+="${theme_name^^}\0icon\x1f${preview}\n"
done
CHOICE=$(printf "%b" "$MENU_ENTRIES" | rofi -dmenu \
    -show-icons \
    -theme "$RASI" \
    -p "SELECT THEME")
[ -z "$CHOICE" ] && exit 0
SELECTED_THEME=$(echo "$CHOICE" | tr '[:upper:]' '[:lower:]')
TARGET_DIR="$THEMES_DIR/$SELECTED_THEME"
if [ ! -d "$TARGET_DIR" ]; then
    notify-send "Theme Switcher" "Error: Theme $SELECTED_THEME not found."
    exit 1
fi
# ── 1. Fix Hyprland Lua Reload ───────────────────────────────────────────────
LUA_FILE=$(find "$TARGET_DIR" -maxdepth 1 -name "*.lua" | head -n 1)
if [ -f "$LUA_FILE" ]; then
    cp "$LUA_FILE" "$HOME/.config/hypr/themes/active.lua"
    hyprctl reload
fi
# ── 2. Fix Kitty Reload ──────────────────────────────────────────────────────
if [ -f "$TARGET_DIR/kitty.conf" ]; then
    cp "$TARGET_DIR/kitty.conf" "$HOME/.config/themes/active-kitty.conf"
    pkill -SIGUSR1 kitty
fi
# ── 3. Apply Noctalia V5 Config ─────────────────────────────────────────────
if [ -f "$TARGET_DIR/noctalia.toml" ]; then
    cp -f "$TARGET_DIR/noctalia.toml" "$HOME/.config/noctalia/config.toml"
fi

# ── 3b. Refresh Firefox theme via Pywalfox ──────────────────────────────────
noctalia msg templates-apply
pywalfox update 2>/dev/null

# ── 4. Fix Dual Monitor PNG Wallpapers & MPV Paper ───────────────────────────
if [ ! -f "$TARGET_DIR/live.mp4" ]; then
    pkill mpvpaper 2>/dev/null
fi
if command -v awww &> /dev/null; then
    [ -f "$TARGET_DIR/wp1.png" ] && awww img --outputs "HDMI-A-1" --transition-type fade "$TARGET_DIR/wp1.png"
    [ -f "$TARGET_DIR/wp2.png" ] && awww img --outputs "DP-2" --transition-type fade "$TARGET_DIR/wp2.png"
elif command -v swww &> /dev/null; then
    [ -f "$TARGET_DIR/wp1.png" ] && swww img -o HDMI-A-1 --transition-type wave "$TARGET_DIR/wp1.png"
    [ -f "$TARGET_DIR/wp2.png" ] && swww img -o DP-2 --transition-type wave "$TARGET_DIR/wp2.png"
fi
echo "$SELECTED_THEME" > "$ACTIVE_MARKER"
notify-send -i "dialog-information" "Theme Matrix" "Activated: $SELECTED_THEME"
