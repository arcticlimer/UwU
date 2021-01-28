local get_memory_usage = "sh -c \"free --giga -th | grep ^Mem | awk '{ printf \\\"%sB\\\",$3 }'\""

awful.widget.watch(get_memory_usage, 3, function(xe, stdout, y)
  awesome.emit_signal("widgets::memory_usage", stdout)
end)


local memory_text =  wibox.widget.textbox("0B")

local memory_icon = wibox.widget{
  markup = '<span color="#6dd676">RAM: </span>',
  align  = 'center',
  valign = 'center',
  widget = wibox.widget.textbox
}

local memory_usage = wibox.container.margin(wibox.widget({
  memory_icon,
  memory_text,
  layout = wibox.layout.fixed.horizontal,
}), 10, 10)

awesome.connect_signal("widgets::memory_usage", function(usage)
  memory_text.text = usage
end)

return memory_usage
