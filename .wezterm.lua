-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.default_prog = { "tmux" }
config.audible_bell = "Disabled"
config.color_scheme = "Catppuccin Mocha"
config.default_workspace = "home"
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.inactive_pane_hsb = {
	brightness = 0.5,
	saturation = 0.5,
}
config.font = wezterm.font_with_fallback({
	{ family = "MonoLisa Custom Nerd Font", weight = "Medium" },
	{ family = "MonoLisa Custom Nerd Font", weight = "Regular" },
})
config.font_size = 15
config.scrollback_lines = 5000
config.use_fancy_tab_bar = false
-- keys
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	-- standard
	{ key = "b", mods = "LEADER|CTRL", action = act.SendKey({ key = "b", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "s", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	-- Panes
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- Pane switching
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	-- Key tables
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
	-- Tab keybindings
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
	},
}

return config
