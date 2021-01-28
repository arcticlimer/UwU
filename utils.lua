function round_widget(widget, color)
  local shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 10)
  end
  return wibox.container.margin(wibox.container.background(widget, color, shape), 0, 10, 5, 0)
end


function set_wallpaper(screen)
  local wallpaper = beautiful.wallpaper
  if wallpaper then
    gears.wallpaper.maximized(wallpaper, screen, false)
  end
end
