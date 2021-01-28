local get_cpu_usage_command = "sh -c \"top -b -n 1 | grep Cpu | awk '{ print $2 }'\""

awful.widget.watch(get_cpu_usage_command, 2, function(xe, stdout, y)
    awesome.emit_signal("widgets::cpu_usage", tonumber(stdout))
end)


local cpu_text =  wibox.widget.textbox("0%")

local cpu_icon = wibox.widget{
    markup = '<span color="#6dd676">  </span>',
    font   = "Ionicons 11",
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local cpu_usage = wibox.container.margin(wibox.widget({
    cpu_icon,
    cpu_text,
    layout = wibox.layout.fixed.horizontal,
}), 10, 10)

awesome.connect_signal("widgets::cpu_usage", function(usage)
    cpu_text.text = usage .. "%"
end)

return cpu_usage
