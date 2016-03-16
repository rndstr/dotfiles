-- theme for awesomewm (hidpi)
-- merges with ~/.config/awosome-theme-local.lua if available
--

theme = {}
theme.icons = os.getenv("HOME") .. "/.config/awesome/themes/rndstr/icons"
theme.default = "/usr/share/awesome/themes/default"
theme.theme = os.getenv("HOME") .. "/.config/awesome/themes/rndstr"

theme.font          = "Hack 16"

theme.bg_normal     = "#000000"
theme.fg_normal     = "#ffffff"

theme.bg_focus      = "#74b8ef"
theme.fg_focus      = "#ffffff"

theme.bg_urgent     = "#d36265"
theme.fg_urgent     = "#111111"

theme.bg_minimize   = "#666666"
theme.fg_minimize   = "#bbbbbb"

theme.fg_widget_value_important = "#444444"
theme.fg_widget_value = "#ff0000"
theme.fg_widget_clock = "#ff0000"

theme.border_width  = 4
theme.border_normal = "#000000"
theme.border_focus  = "#74b8ef"
theme.border_marked = "#91231c"

--theme.taglist_squares_sel    = theme.theme .. "/tasklist_f.png"
--theme.taglist_squares_unsel  = theme.theme .. "/tasklist_u.png"
--theme.tasklist_floating_icon = theme.theme .. "/floating.png"
theme.taglist_squares_sel    = theme.default .. "/taglist/squarefw.png"
theme.taglist_squares_unsel  = theme.default .. "/taglist/squarew.png"
theme.tasklist_floating_icon = theme.default .. "/tasklist/floatingw.png"

theme.titlebar_close_button_normal = theme.default .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = theme.default .. "/titlebar/close_focus.png"

theme.menu_height = "30"
theme.menu_width  = "225"
theme.menu_submenu_icon = theme.default .. "/submenu.png"
--
-- You can use your own layout icons like this:
theme.layout_fairh      = theme.default .. "/layouts/fairhw.png"
theme.layout_fairv      = theme.default .. "/layouts/fairvw.png"
theme.layout_floating   = theme.default .. "/layouts/floatingw.png"
theme.layout_magnifier  = theme.default .. "/layouts/magnifierw.png"
theme.layout_max        = theme.default .. "/layouts/maxw.png"
theme.layout_fullscreen = theme.default .. "/layouts/fullscreenw.png"
theme.layout_tilebottom = theme.default .. "/layouts/tilebottomw.png"
theme.layout_tileleft   = theme.default .. "/layouts/tileleftw.png"
theme.layout_tile       = theme.default .. "/layouts/tilew.png"
theme.layout_tiletop    = theme.default .. "/layouts/tiletopw.png"
theme.layout_spiral     = theme.default .. "/layouts/spiralw.png"
theme.layout_dwindle    = theme.default .. "/layouts/dwindlew.png"


-- {{{ widgets
theme.widget_bat    = theme.icons .. "/bat.png"
theme.widget_cpu    = theme.icons .. "/cpu.png"
theme.widget_crypto = theme.icons .. "/crypto.png"
theme.widget_date   = theme.icons .. "/time.png"
theme.widget_fs     = theme.icons .. "/disk.png"
theme.widget_mail   = theme.icons .. "/mail.png"
theme.widget_music  = theme.icons .. "/music.png"
theme.widget_mem    = theme.icons .. "/mem.png"
theme.widget_net    = theme.icons .. "/down.png"
theme.widget_netup  = theme.icons .. "/up.png"
theme.widget_org    = theme.icons .. "/cal.png"
theme.widget_temp   = theme.icons .. "/temp.png"
theme.widget_sep    = theme.icons .. "/separator.png"
theme.widget_vol    = theme.icons .. "/vol.png"
theme.widget_wifi   = theme.icons .. "/wifi.png"
-- }}}

theme.titlebar_close_button_normal              = theme.default .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.default .. "/titlebar/close_focus.png"

theme.wallpaper = theme.theme .. "/wallpaper/palette.png"

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

if file_exists("/home/rndstr/.config/awesome-theme-local.lua") then
    package.path = package.path .. ";/home/rndstr/.config/?.lua"
    local loc = require("awesome-theme-local")
    for k,v in pairs(loc) do theme[k] = v end
end

return theme
-- vim:set filetype=lua expandtab shiftwidth=4 tabstop=8 softtabstop=4 textwidth=80 foldmethod=marker nospell:
