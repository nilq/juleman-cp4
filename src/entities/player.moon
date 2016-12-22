(x, y) ->
  p = {
    :x, :y

    w: 16
    h: 16

    dx: 0
    dy: 0

    frc_x: 0.1
    frc_y: 2

    acc: 25

    sprite: game.sprites.player

    left:  "a"
    right: "d"
    jump:  "space"

    grounded: true
    jump_height: 5

    gravity: 25
  }

  with p
    .w = .sprite\getWidth!
    .h = .sprite\getHeight!

  p
