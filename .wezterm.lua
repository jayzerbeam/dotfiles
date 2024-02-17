local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.audible_bell = "Disabled"
config.colors = {
	-- Better cursor color.
	cursor_bg = "#CDD6F4",
	cursor_fg = "#1E1E2E",
	tab_bar = {
		background = "#101019",
		active_tab = {
			bg_color = "#1E1E2E",
			fg_color = "#CDD6F4",
			intensity = "Bold",
			italic = true,
		},
		inactive_tab = {
			bg_color = "#161622",
			fg_color = "#6C7086",
		},
		inactive_tab_hover = {
			bg_color = "#161622",
			fg_color = "#6C7086",
			italic = true,
		},
		new_tab_hover = {
			bg_color = "#161622",
			fg_color = "#6C7086",
			italic = true,
		},
	},
}
config.color_scheme = "Catppuccin Mocha"
config.default_workspace = "home"
config.enable_tab_bar = true
-- Match tab bar width to neovim buffer width
config.hide_tab_bar_if_only_one_tab = false
config.inactive_pane_hsb = {
	brightness = 0.75,
	saturation = 1.0,
}
-- keys
config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
	},
}
config.keys = {
	-- standard
	{ key = "b", mods = "LEADER|CTRL", action = act.SendKey({ key = "b", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
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
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}
config.font = wezterm.font_with_fallback({
	{ family = "MonoLisa Nerd Font", weight = "Regular" },
})
config.font_size = 15
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }
config.scrollback_lines = 10000
config.tab_bar_at_bottom = true
config.tab_max_width = 23
config.use_fancy_tab_bar = false

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

return config
