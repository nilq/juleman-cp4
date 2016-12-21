local controller

with tiny
  controller        = .processingSystem!
  controller.filter = .requireAll "key.left", "key.right", "key.jump", "dx", "dy", "acc", "grounded", "jump"

controller.process = (e, dt) =>
  with love.keyboard
    if .isDown e.key.right
      e.dx += e.acc * dt
    if .isDown e.key.left
      e.dx -= e.acc * dt

    if .isDown e.key.jump
      e.dy = -e.jump if e.grounded

controller
