-- User raw hypr config for caelestia.
-- Loaded at the end of ~/.local/share/caelestia/hypr/hyprland.lua via
-- `require("hypr-user")`, so the full `hl` API is available here.
-- Migrated from the legacy hypr-user.conf.

----------------------------------------------------------------------
-- Input (overrides caelestia's hyprland/input.lua, which runs earlier)
----------------------------------------------------------------------
hl.config({
    input = {
        kb_layout          = "br,us",
        kb_options         = "grp:alt_space_toggle",

        numlock_by_default = false,
        repeat_delay       = 250,
        repeat_rate        = 35,
        focus_on_close     = 1,

        touchpad           = {
            natural_scroll       = true,
            disable_while_typing = true,
            scroll_factor        = 0.3,
        },
    },
})

----------------------------------------------------------------------
-- Window actions (vim-style focus/move)
----------------------------------------------------------------------
-- Move active window in a direction
-- NOTE: caelestia's hyprland/keybinds.lua binds `SUPER + SHIFT + L` to
-- `systemctl suspend-then-hibernate` (the "Sleep" gesture). That bind is
-- registered before this file loads, so without removing it our move-right
-- bind below collides and the machine suspends instead of moving the window.
-- Drop caelestia's sleep bind first so our bind wins.
hl.unbind("SUPER + SHIFT + L")

hl.bind("SUPER + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

-- Move focus in a direction
hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))

-- Overview toggle
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("qs ipc -c overview call overview toggle"))

-- Toggle split direction
hl.bind("SUPER + ALT + J", hl.dsp.layout("togglesplit"))

----------------------------------------------------------------------
-- Gestures (migrated from hypr-user.conf)
----------------------------------------------------------------------
-- gesture = 3, down, mod: alt, close
hl.gesture({ fingers = 3, direction = "down", mods = "alt", action = "close" })
-- gesture = 3, horizontal, workspace
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
-- gesture = 3, swipe, mod: SUPER, resize
hl.gesture({ fingers = 3, direction = "swipe", mods = "super", action = "resize" })
-- gesture = 3, pinch, fullscreen
hl.gesture({ fingers = 3, direction = "pinch", action = "fullscreen" })
-- gesture = 3, up, fullscreen, maximize
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen", mode = "maximize" })
-- gesture = 3, down, fullscreen, maximize
hl.gesture({ fingers = 3, direction = "down", action = "fullscreen", mode = "maximize" })

----------------------------------------------------------------------
-- Plugins
----------------------------------------------------------------------
-- Load hyprpm plugins (dynamic-cursors) on startup
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload -n")
end)

-- NOTE: the plugin:dynamic-cursors {...} config block from the old
-- plugins/dinamic-cursors.conf still needs to be applied as raw config.
-- This is finalized below once the raw-config API is confirmed.

----------------------------------------------------------------------
-- Monitors (migrated from nwg-displays monitors.conf)
----------------------------------------------------------------------
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "3840x2160@30", position = "6661x3472", scale = 2 })

----------------------------------------------------------------------
-- Workspace assignments (migrated from nwg-displays workspaces.conf)
----------------------------------------------------------------------
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "6", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "7", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "8", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "9", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "10", monitor = "eDP-1" })
