local taglist_buttons =
    gears.table.join(
    awful.button(
        {},
        1,
        function(t)
            t:view_only()
        end
    ),
    awful.button(
        {modkey},
        1,
        function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    ),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button(
        {modkey},
        3,
        function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end
    ),
    awful.button(
        {},
        4,
        function(t)
            awful.tag.viewnext(t.screen)
        end
    ),
    awful.button(
        {},
        5,
        function(t)
            awful.tag.viewprev(t.screen)
        end
    )
)

local function create_taglist(screen)
  return awful.widget.taglist {
    screen = screen,
    filter = awful.widget.taglist.filter.all,
    style = {},
    layout = {
        layout = wibox.layout.fixed.horizontal
    },
    widget_template = {
        {
            {
                {
                    {
                        {
                            id = "text_role",
                            widget = wibox.widget.textbox
                        },
                        margins = 8,
                        widget = wibox.container.margin
                    },
                    bg = "#111",
                    fg = "#ccc",
                    shape = gears.shape.circle,
                    widget = wibox.container.background
                },
                layout = wibox.layout.fixed.horizontal
            },
            left = 8,
            right = 8,
            widget = wibox.container.margin
        },
        id = "background_role",
        widget = wibox.container.background,
    },
    buttons = taglist_buttons
  }
end

return create_taglist
