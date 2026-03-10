#!/bin/bash
# === CONFIG ===
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper"
cd "$WALLPAPER_DIR" || exit 1
# === handle spaces name
IFS=$'\n'
# === ICON-PREVIEW SELECTION WITH ROFI, SORTED BY NEWEST ===
SELECTED_WALL=$(for a in $(ls -t *.jpg *.png *.gif *.jpeg 2>/dev/null); do echo -en "$a\0icon\x1f$a\n"; done | rofi -dmenu -p "")
[ -z "$SELECTED_WALL" ] && exit 1
SELECTED_PATH="$WALLPAPER_DIR/$SELECTED_WALL"

# === SET WALLPAPER WITH SWWW ===
TRANSITIONS=("fade" "wipe" "grow" "outer" "wave" "center")
RANDOM_TRANSITION=${TRANSITIONS[$RANDOM % ${#TRANSITIONS[@]}]}
swww img "$SELECTED_PATH" \
    --transition-type="$RANDOM_TRANSITION" \
    --transition-duration=2 \
    --transition-fps=60

# === GENERATE COLORS ===
matugen image "$SELECTED_PATH"

# === CREATE SYMLINK ===
mkdir -p "$(dirname "$SYMLINK_PATH")"
ln -sf "$SELECTED_PATH" "$SYMLINK_PATH"

# === COPY COLORS TO STYLE DIR ===
cp ~/.config/waybar/colors.css ~/.config/waybar/style/

# === RELOAD WAYBAR ===
killall waybar
waybar -c ~/.config/waybar/configs/"bintang default" -s ~/.config/waybar/style/"bintang default.css" &

# === RELOAD HYPRLAND TO APPLY COLORS ===
