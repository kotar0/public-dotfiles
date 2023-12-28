-- Pull in the wezterm API
local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, pane)
	-- demonstrates shelling out to get some external status.
	-- wezterm will parse escape sequences output by the
	-- child process and include them in the status area, too.
	local success, date, stderr = wezterm.run_child_process({ "date" })

	-- However, if all you need is to format the date/time, then:
	date = wezterm.strftime("%Y-%m-%d %H:%M:%S")

	-- Make it italic and underlined
	window.set_right_status(wezterm.format({
		{ Attribute = { Underline = "Single" } },
		{ Attribute = { Italic = true } },
		{ Text = "Hello " .. date },
	}))
end)

-- ---------------------------------------------------

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Night Owl (Gogh)"

-- Font
config.font = wezterm.font_with_fallback({
	{ family = "Dank mono", scale = 1.2 },
	{ family = "Symbols Nerd Font Mono", scale = 0.85 },
})
config.font_size = 12.0

-- Tab
config.hide_tab_bar_if_only_one_tab = true

local tab_colors = {
	background = "#011627",
	foreground = "#d6deeb",
}

config.colors = {
	cursor_bg = "#637777", -- 後で変える
	tab_bar = {
		background = tab_colors.background,
		active_tab = {
			fg_color = tab_colors.foreground,
			bg_color = tab_colors.background,
		},
		inactive_tab = {
			fg_color = "#7E97AC",
			bg_color = tab_colors.background,
		},
		new_tab = {
			bg_color = tab_colors.background,
			fg_color = "#7E97AC",
		},
	},
}

-- The filled in variant of the <
config.window_padding = {
	left = 0,
	right = -1,
	top = 0,
	bottom = 0,
}

config.window_frame = {
	active_titlebar_bg = "#011627",
	inactive_titlebar_bg = "#7E97AC",
}

config.window_decorations = "RESIZE"

config.line_height = 1.3

-- Keymaps
local act = wezterm.action
config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "h", mods = "ALT|CMD", action = act.ActivateTabRelative(-1) },
	{ key = "l", mods = "ALT|CMD", action = act.ActivateTabRelative(1) },
	{ key = "LeftArrow", mods = "ALT|CMD", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "ALT|CMD", action = act.ActivateTabRelative(1) },
	{ key = "h", mods = "LEADER", action = act.SplitHorizontal({
		domain = "CurrentPaneDomain",
	}) },
	{ key = "v", mods = "LEADER", action = act.SplitVertical({
		domain = "CurrentPaneDomain",
	}) },
}

-- and finally, return the configuration to wezterm
return config
