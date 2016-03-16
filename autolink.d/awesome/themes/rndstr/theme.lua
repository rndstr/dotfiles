-- theme for awesomewm (hidpi)
-- merges with ~/.config/awosome-theme-local.lua if available

local the = {
    font          = "Hack 16",

    bg_normal     = "#000000",
    bg_focus      = "#ffffff",
    bg_urgent     = "#ffdd00",

    fg_normal     = "#eeeeff",
    fg_focus      = "#000000",
    fg_urgent     = "#111111",

    fg_widget_value_important = "#444444",
    fg_widget_value = "#ff0000",
    fg_widget_clock = "#ff0000",

    border_width  = 3,
    border_normal = "#000000",
    border_focus  = "#ffffff",

    taglist_squares_sel    = "/home/rndstr/.config/awesome/themes/rndstr/tasklist_f.png",
    taglist_squares_unsel  = "/home/rndstr/.config/awesome/themes/rndstr/tasklist_u.png",
    tasklist_floating_icon = "/home/rndstr/.config/awesome/themes/rndstr/floating.png",

    titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png",
    titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png",

    wallpaper = "/home/rndstr/.config/awesome/themes/rndstr/wallpaper/palette.png",
    menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png",
    awesome_icon = "/home/rndstr/.config/awesome/themes/rndstr/floating.png"
}

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

if file_exists("/home/rndstr/.config/awesome-theme-local.lua") then
    package.path = package.path .. ";/home/rndstr/.config/?.lua"
    local loc = require("awesome-theme-local")
    for k,v in pairs(loc) do the[k] = v end
end

return the
