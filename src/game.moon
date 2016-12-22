export tiny = require "src/lib/tiny"

export game = {
  scale: 16
  ----------------------------------
  -- mapping entity IDs to map colors
  ----------------------------------
  map_stuff: {
    "player": {r: 255, g: 0, b: 0}
    "block":  {r: 0,   g: 0, b: 0}
  }
  ----------------------------------
  -- initially loaded sprite - "efficiency!"
  ----------------------------------
  sprites: {
    player: love.graphics.newImage "assets/player.png"
    block:  love.graphics.newImage "assets/block.png"
  }
}

game.load = ->
  love.graphics.setBackgroundColor 100, 100, 100

  export world      = tiny.world!
  export draw_world = tiny.world!

  with world
    import movement, controller from require "src/systems"

    \addSystem controller
    \addSystem movement

  with draw_world
    import sprite from require "src/systems"
    \addSystem sprite

  with game
    .load_level "assets/levels/test.png"

game.update = (dt) ->
  love.window.setTitle "FPS: #{love.timer.getFPS!}"

  world\update dt

game.draw = ->
  draw_world\update!

game.assemble = (t, ...) ->
  import player, block from require "src/entities"

  switch t
    when "player"
      p = player ...
      bump_world\add p, p.x, p.y, p.w, p.h

      with world
        \addEntity p

      with draw_world
        \addEntity p

    when "block"
      p = block ...
      bump_world\add p, p.x, p.y, p.w, p.h

      with world
        \addEntity p

      with draw_world
        \addEntity p

game.load_level = (path) ->
  with game
    .enemies = {}

    image = love.image.newImageData path

    for x = 1, image\getWidth!
      for y = 1, image\getHeight!

        rx, ry = x - 1, y - 1
        r, g, b = image\getPixel rx, ry

        for k, v in pairs .map_stuff
          if r == v.r and g == v.g and b == v.b
            .assemble k, .scale * rx, .scale * ry
game
