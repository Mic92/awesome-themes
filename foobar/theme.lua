--[[
foobar is derived from foo, a high contrast awesome3 theme, by rob
changeset compared to the origin:
    - default sans font
    - archlinux blue and a decent white as focus colors
    - wider menu (just my personal preference)
--]]

--{{{ Main
require("awful.util")

theme = {}

home          = os.getenv("HOME")
config        = awful.util.getdir("config")
shared        = "/usr/share/awesome"
if not awful.util.file_readable(shared .. "/icons/awesome16.png") then
    shared    = "/usr/share/local/awesome"
end
sharedicons   = shared .. "/icons"
sharedthemes  = shared .. "/themes"
themes        = config .. "/themes"
themename     = "/foobar"
if not awful.util.file_readable(themes .. themename .. "/theme.lua") then
       themes = sharedthemes
end
themedir      = config .. "/awesome-themes" .. themename

wallpaper1    = themedir .. "/background.jpg"
wallpaper2    = themedir .. "/background.png"
wallpaper3    = sharedthemes .. "/zenburn/zenburn-background.png"
wallpaper4    = sharedthemes .. "/default/background.png"
wpscript      = home .. "/.wallpaper"

if awful.util.file_readable(wallpaper1) then
	theme.wallpaper_cmd = { "awsetbg " .. wallpaper1 }
elseif awful.util.file_readable(wallpaper2) then
	theme.wallpaper_cmd = { "awsetbg " .. wallpaper2 }
elseif awful.util.file_readable(wpscript) then
	theme.wallpaper_cmd = { "sh " .. wpscript }
elseif awful.util.file_readable(wallpaper3) then
	theme.wallpaper_cmd = { "awsetbg " .. wallpaper3 }
else
	theme.wallpaper_cmd = { "awsetbg " .. wallpaper4 }
end

if awful.util.file_readable(config .. "/vain/init.lua") then
    theme.useless_gap_width  = "3"
end
--}}}

theme.font    = "sans 11"

theme.bg_normal     = "#333333"
theme.bg_focus      = "#1793d1"
theme.bg_urgent     = "#00ff00"

theme.fg_normal     = "#999999"
theme.fg_focus      = "#fafafa"
theme.fg_urgent     = "#111111"

theme.border_width  = 2
theme.border_normal = "#333333"
theme.border_focus  = "#1793d1"

theme.taglist_squares_sel         = themedir .. "/tasklist_f.png"
theme.taglist_squares_unsel       = themedir .. "/tasklist_u.png"
theme.tasklist_floating_icon      = themedir .. "/floating.png"

theme.titlebar_close_button_normal = sharedthemes .. "/default/titlebar/close.png"
theme.titlebar_close_button_focus  = sharedthemes .. "/default/titlebar/closer.png"

theme.menu_submenu_icon = sharedthemes .. "/default/submenu.png"
theme.menu_height   = 15
theme.menu_width    = 130

theme.awesome_icon = sharedicons .. "/awesome16.png"

return theme
