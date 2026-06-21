# caelestia

This repository holds **my personal Caelestia configuration and overrides**.

It is not the upstream Caelestia dots — it contains my customizations on top of the
[Caelestia](https://github.com/caelestia-dots/caelestia) setup, managed with the
`caelestia` CLI (`caelestia install` / `caelestia update`).

## Custom overrides

### Gestures (3-finger up/down → maximize)

I overrode the **three-finger swipe up** and **three-finger swipe down** gestures to
**maximize the focused window**.

These overrides live in my user config and **conflict with the gestures defined in
`hypr/hyprland/gestures.lua`** — Hyprland raises a gesture conflict error when both
the upstream `gestures.lua` definitions and my overrides are registered at the same
time.

To work around this, I **commented out the conflicting lines in
`~/.config/hypr/hyprland/gestures.lua`**.

> ⚠️ **Caveat:** `gestures.lua` is a Caelestia-managed file. Every time I run
> `caelestia update`, my changes are kept but the upstream version is written
> alongside as `gestures.lua.new` (and a fresh deploy would restore the conflicting
> lines). **So for now, after every `caelestia update` I have to comment out those
> lines in the `hyprland` folder again.**

## Config format: use `.lua`, not `.conf`

The legacy `hypr-user.conf` / `hypr-vars.conf` files are **deprecated by Caelestia**.

The current, correct approach is to use the **`.lua`** equivalents:

- `hypr-user.lua` — raw user Hypr config (keybinds, rules, gestures, monitors, etc.)
- `hypr-vars.lua` — variable overrides

These are loaded at the end of Caelestia's `hyprland.lua` and live in
`~/.config/caelestia/`, so they are **not** overwritten by `caelestia update`.
