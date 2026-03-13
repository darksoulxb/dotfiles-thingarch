# dotfiles — darksoulxb

CachyOS + Hyprland setup.

## Snapshot
`recov-thingarch` — pre end-4/dots-hyprland integration backup.
This is the base state to roll back to if anything breaks.

## Restore
```bash
cp -r .config/hypr ~/.config/hypr
cp -r .config/waybar ~/.config/waybar
cp -r .config/mako ~/.config/mako
# repeat for whatever you need
```

## Stack
- OS: CachyOS
- WM: Hyprland
- Bar: Waybar
- Notifications: Mako / Swaync
- Terminal: Kitty / Foot
