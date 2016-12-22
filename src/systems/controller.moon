local controller

with tiny
  controller        = .processingSystem!
  controller.filter = .requireAll "left", "right", "jump", "dx", "dy", "acc", "grounded", "jump_height"

controller.process = (e, dt) =>
  with love.keyboard
    if .isDown e.right
      e.dx += e.acc * dt
    if .isDown e.left
      e.dx -= e.acc * dt

    if .isDown e.jump
      e.dy = -e.jump_height if e.grounded

controller
