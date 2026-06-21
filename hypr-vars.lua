-- User variable overrides for caelestia's hypr config.
-- These are merged over ~/.local/share/caelestia/hypr/variables.lua
-- (see hyprland.lua: `local overrides = require("hypr-vars")`).
return {
    -- Apps
    browser = "google-chrome-stable",

    -- Cursor
    cursorTheme = "phinger-cursors-dark",
    cursorSize = 48,

    -- Keybinds (migrated from hypr-vars.conf)
    kbLock = "SUPER + ALT + L",
    kbRestoreLock = "SUPER + ALT + SHIFT + L",
    kbShowPanels = "SUPER + ALT + K",
    kbWindowFullscreen = "SUPER + ALT + F",
    kbWindowBorderedFullscreen = "SUPER + F",
}
