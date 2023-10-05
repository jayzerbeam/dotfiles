-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.default_prog = { "tmux" }
config.audible_bell = "Disabled"
config.enable_tab_bar = false
config.font = wezterm.font("MonoLisa Custom Nerd Font", { weight = "Medium" })
config.font_size = 15
config.keys = {
	{ key = "-", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
	{ key = "=", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
}
config.use_fancy_tab_bar = false
config.window_padding = {
	left = "10px",
	right = "10px",
	bottom = "0px",
	top = "16px",
}

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = 'Oceanic-Next'

-- and finally, return the configuration to wezterm
return config
