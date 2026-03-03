-- Pull in the wezterm API
local wezterm = require("wezterm")

-- wezterm.on("update-right-status", function(window, pane)
-- 	-- demonstrates shelling out to get some external status.
-- 	-- wezterm will parse escape sequences output by the
-- 	-- child process and include them in the status area, too.
-- 	local success, date, stderr = wezterm.run_child_process({ "date" })
--
-- 	-- However, if all you need is to format the date/time, then:
-- 	date = wezterm.strftime("%Y-%m-%d %H:%M:%S")
--
-- 	-- Make it italic and underlined
-- 	window.set_right_status(wezterm.format({
-- 		{ Attribute = { Underline = "Single" } },
-- 		{ Attribute = { Italic = true } },
-- 		{ Text = "Hello " .. date },
-- 	}))
-- end)
--

local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local nerd_icons = {
		nvim = wezterm.nerdfonts.cod_symbol_namespace,
		bash = wezterm.nerdfonts.dev_terminal,
		fish = wezterm.nerdfonts.md_fish,
		ssh = wezterm.nerdfonts.mdi_server,
		top = wezterm.nerdfonts.mdi_monitor,
		docker = wezterm.nerdfonts.dev_docker,
		node = wezterm.nerdfonts.dev_nodejs_small,
		gitui = wezterm.nerdfonts.cod_source_control,
	}

	local icon_colors = {
		nvim = "0xff000000",
		bash = "0x00ffffff",
		fish = "0x00ffffff",
		ssh = "0x00ffffff",
		top = "0x00ffffff",
		docker = "0xff000000",
		node = "0xff000000",
		gitui = "0xff000000",
	}

	local zoomed = ""
	if tab.active_pane.is_zoomed then
		zoomed = "[Z] "
	end
	local pane = tab.active_pane
	local process_name = basename(pane.foreground_process_name)
	local icon = nerd_icons[process_name]
	local color = icon_colors[process_name] or "0xff000000" -- デフォルトの色
	local index = tab.tab_index + 1
	local cwd = basename(pane.current_working_dir)

	-- 例) 1:project_dir | zsh
	local title = index .. ": " .. cwd .. "  | " .. process_name
	if icon ~= nil then
		title = icon .. "  " .. zoomed .. title
	end
	return {
		{ Text = " " .. title .. " " },
	}
end)

-- Leader indicator
wezterm.on("update-right-status", function(window, pane)
	local leader = ""
	if window:leader_is_active() then
		leader = " LEADER "
	end
	window:set_right_status(leader)
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

-- cursor
config.default_cursor_style = "SteadyBar"

-- Font
config.font = wezterm.font_with_fallback({
	{ family = "Dank mono", scale = 1.2 },
	{ family = "Noto Sans Mono CJK JP", weight = "Medium" },
	{ family = "Symbols Nerd Font Mono", scale = 0.85 },
})
config.font_size = 12.0

-- Tab
config.hide_tab_bar_if_only_one_tab = false -- デバッグ中: LEADERインジケーター確認のため一時的にfalse

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

-- Debug
config.debug_key_events = true

-- Keymaps
local act = wezterm.action
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	-- Tab
	{ key = "h", mods = "ALT|CMD", action = act.ActivateTabRelative(-1) },
	{ key = "l", mods = "ALT|CMD", action = act.ActivateTabRelative(1) },
	{ key = "LeftArrow", mods = "ALT|CMD", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "ALT|CMD", action = act.ActivateTabRelative(1) },
	-- Split Pane
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- Move Pane
	{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	-- Resize Pane
	{ key = "h", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "j", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
}

-- and finally, return the configuration to wezterm
return config
