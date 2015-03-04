-- /etc/xdg/awesome/rc.lua
-- http://awesome.naquadah.org/wiki/Awesome_3.4_to_3.5
--
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local vicious = require("vicious")
local keydoc = require("keydoc")
local menubar = require("menubar")
local wibox = require("wibox")



-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
-- beautiful.init("/usr/share/awesome/themes/sky/theme.lua")
beautiful.init("/home/rndstr/.config/awesome/themes/rndstr/rndstr.lua")
for s = 1, screen.count() do
	gears.wallpaper.maximized(beautiful.wallpaper, s, true)
end

-- This is used later as the default terminal and editor to run.
terminal = "urxvt -e screen -U"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.max,
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
--    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
--    awful.layout.suit.spiral.dwindle,
--    awful.layout.suit.magnifier
}

-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
  names = { "1", "2", "3", "4", "5", 6, 7, 8, 9 },
  layout = {
    layouts[3],
    layouts[1],
    layouts[2],
    layouts[3],
    layouts[3],
    layouts[3],
    layouts[3],
    layouts[3],
    layouts[3]
  }
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox
separator = wibox.widget.textbox()
separator:set_text(" • ")
--  Network usage widget
-- Initialize widget
-- Register widget
netwidget = wibox.widget.textbox()
--vicious.register(netwidget, vicious.widgets.net, '${wlan0 down_kb}K/${wlan0 up_kb}K', 3)
vicious.register(netwidget, vicious.widgets.net, function (widget, args)
    return string.format("%4dK%4dK", args["{wlan0 up_kb}"], args["{wlan0 down_kb}"])
end)

vcpu = wibox.widget.textbox()
vicious.register(vcpu, vicious.widgets.cpu, function (widget, args)
    return string.format("%02d:%02d:%02d:%02d", args[1], args[2], args[3], args[4])
end)

vthermal = wibox.widget.textbox()
vicious.register(vthermal, vicious.widgets.thermal, ' $1C', 2, 'thermal_zone0')

vbat = wibox.widget.textbox()
vicious.register(vbat, vicious.widgets.bat, '$1$2% ($3)', 2, 'BAT0')

vmem = wibox.widget.textbox()
vicious.register(vmem, vicious.widgets.mem, function (widget, args)
    return string.format("%4d/%d", args[2], args[3])
end)


-- Create a textclock widget
mytextclock = awful.widget.textclock('%Y%m%d %H:%M ')

-- Create a systray
--mysystray = wibox.widget.systray()

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(separator)
    right_layout:add(vbat)
    right_layout:add(separator)
    right_layout:add(vcpu)
    right_layout:add(vthermal)
    right_layout:add(separator)
    right_layout:add(vmem)
    right_layout:add(separator)
    right_layout:add(netwidget)
    right_layout:add(separator)
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(separator)
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    keydoc.group("Layout manipulation"),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       , "Previous tag"),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       , "Next tag"),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore, "Switch to previous"),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end, "Focus next window"),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end, "Focus previous window"),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end, "Show menu"),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end, "Swap window"),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end, "Swap window"),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end, "?"),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end, "?"),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto, "?"),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end, "Focus previous window"),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end, "Spawn terminal"),
    awful.key({ modkey, "Control" }, "r", awesome.restart, "Awesome restart"),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit, "Awesome quit"),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    awful.key({ modkey, }, "F1", keydoc.display)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end, "Fullscreen"),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end, "Kill window"),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     , "Toggle floating style"),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "Chromium" },
      properties = { tag = tags[1][2] } },
    { rule = { class = "Skype" },
      properties = { tag = tags[1][5] } },
    { rule = { class = "gimp" },
      properties = { tag = tags[1][4]} },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Add a titlebar
    --awful.titlebar(c, { modkey = modkey, bg_focus = '#94c0e4', height = 16 })

    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
--
function run_once(pre, prg, params)
  awful.util.spawn_with_shell("pgrep -x " .. prg .. " || (" .. pre .. " " .. prg .. " " .. params .. ")")
end


run_once("sudo", "nm-applet", "")
run_once("sudo", "blueman-applet", "")
run_once("", "pasystray", "")
run_once("", "batterymon", "")
--run_once("", "google-musicmanager", "")