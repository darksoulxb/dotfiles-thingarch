#!/bin/bash
current=$(cat /sys/class/leds/platform::kbd_backlight/brightness)
if [ "$current" -eq 0 ]; then
    brightnessctl --device platform::kbd_backlight set 1
elif [ "$current" -eq 1 ]; then
    brightnessctl --device platform::kbd_backlight set 2
else
    brightnessctl --device platform::kbd_backlight set 0
fi
