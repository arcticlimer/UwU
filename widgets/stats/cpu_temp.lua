local get_cpu_temp_command = "sh -c \"sensors | grep ^Package | awk '{printf $4}' | grep -Po '\\d+.\\d+' \""

awful.widget.watch(get_cpu_temp_command, 2, function(xe, stdout, y)
    awesome.emit_signal("widgets::cpu_temp", tonumber(stdout))
end)


local cpu_text =  wibox.widget.textbox("0°C")

local cpu_icon = wibox.widget{
    markup = '<span color="#dbff29">🌡  </span>',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local cpu_temp = wibox.container.margin(wibox.widget({
    cpu_icon,
    cpu_text,
    layout = wibox.layout.fixed.horizontal,
}), 10, 10)

-- Sinal do uso de cpu usado
awesome.connect_signal("widgets::cpu_temp", function(usage)
    cpu_text.text = usage .. "°C"
end)

return cpu_temp
