-- Weekday month day, hour:minutes
local format = "%A %b %d, %H:%M"

local text_clock = wibox.widget.textclock(format)

local clock_icon = wibox.widget{
    markup = "<span color='#cf6dd6'>  </span>",
    font = "Ionicons 11",
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local clock = wibox.container.margin(wibox.widget({
    clock_icon,
    text_clock,
    layout = wibox.layout.fixed.horizontal,
}), 10, 10)

return clock
