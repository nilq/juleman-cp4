(x, y) ->
  {
    :x, :y

    w: 16
    h: 16

    dx: 0
    dy: 0

    frc_x: 0.5
    frc_y: 2

    acc: 25

    sprite: love.graphics.newImage "assets/player.png"

    left:  "a"
    right: "d"
    jump:  "space"

    grounded: true
    jump_height: 10

    gravity: 15
  }
