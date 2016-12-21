export tiny = require "src/lib/tiny"

game = {}

game.load = ->
  export world      = tiny.world!
  export draw_world = tiny.world!

  with world
    import movement from require "src/systems"
    \addSystem movement

  with draw_world
    import sprite from require "src/systems"
    \addSystem sprite

  with game
    .assemble "player", 100, 100

game.update = (dt) ->
  world\update dt

game.draw = ->
  draw_world\update!

game.assemble = (t, ...) ->
  import player from require "src/entities"

  switch t
    when "player"
      p = player ...

      with world
        \addEntity p

      with draw_world
        \addEntity p
game