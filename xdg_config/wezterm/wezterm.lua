local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 14
config.window_decorations = "RESIZE"
config.color_scheme = 'rose-pine'
config.audible_bell = 'Disabled'

config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.tab_bar_at_bottom = true

return config
