function round_widget(widget, color)
  local shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 10)
  end
  return wibox.container.margin(wibox.container.background(widget, color, shape), 0, 10, 5, 0)
end
