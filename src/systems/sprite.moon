local sprite

with tiny
  sprite        = .processingSystem!
  sprite.filter = .requireAll "x", "y", "sprite"

sprite.process = (e, dt) =>
  with e
    love.graphics.setColor 255, 255, 255
    love.graphics.draw .sprite, .x, .y, (.rotation or 0), (.sx or 1), .sy or 1

sprite
