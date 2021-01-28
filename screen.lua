local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local layout_margin = 3

-- Import widgets
local clock_widget = require("widgets/stats/clock")
local cpu_usage_widget = require("widgets/stats/cpu_usage")
local cpu_temperature_widget = require("widgets/stats/cpu_temp")
local memory_usage_widget = require("widgets/stats/memory_usage")

local create_taglist = require("widgets/taglist")

awful.screen.connect_for_each_screen(
    function(screen)
        set_wallpaper(screen)

        -- Tags para cada workspace
        awful.tag({"1", "2", "3", "4", "5"}, screen, awful.layout.layouts[1])

        screen.mytaglist = create_taglist(screen)

        -- Prompt para chamar os aplicativos
        screen.mypromptbox = awful.widget.prompt()

        -- Inicio da wibar
        screen.mywibox =
            awful.wibar(
            {
                position = "top",
                screen = screen,
                height = 30
            }
        )

        -- Setup da wibar
        screen.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
                screen.mytaglist,
                screen.mypromptbox
            },
            nil,
            {
                layout = wibox.layout.fixed.horizontal,
                round_widget(memory_usage_widget, "#111"),
                round_widget(cpu_temperature_widget, "#111"),
                round_widget(cpu_usage_widget, "#111"),
                round_widget(clock_widget, "#111")
            }
        }
    end
)
