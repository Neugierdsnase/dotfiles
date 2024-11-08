-- Pull in the wezterm API
local wezterm = require "wezterm"

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Spawn a fish shell in login mode
config.default_prog = { '/usr/bin/tmux' }

config.color_scheme = "Kanagawa (Gogh)"
config.window_decorations = "RESIZE"

-- tmux
config.leader = { key = "0", mods="CTRL", timeout_milliseconds = 2500 }
config.keys = {
    {
        mods = "LEADER",
        key = "c",
        action = wezterm.action.SpawnTab "CurrentPaneDomain",
    },
    {
        mods = "LEADER",
        key = "x",
        action = wezterm.action.CloseCurrentPane { confirm = true }
    },
    {
        mods = "LEADER",
        key = "p",
        action = wezterm.action.ActivateTabRelative(-1)
    },
    {
        mods = "LEADER",
        key = "n",
        action = wezterm.action.ActivateTabRelative(1)
    },
}

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true

-- and finally, return the configuration to wezterm
return config
