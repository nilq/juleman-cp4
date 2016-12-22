local movement

with tiny
  movement        = .processingSystem!
  movement.filter = .requireAll "x", "y", "dx", "dy", "frc_x", "frc_y", "gravity", "grounded"

movement.process = (e, dt) =>
  return unless bump_world\hasItem e
  with e
    .grounded = false

    .dx   -= (.dx / .frc_x) * dt
    .dy   -= (.dy / .frc_y) * dt

    .x, .y, cols = bump_world\move e, .x + .dx, .y + .dy

    for c in *cols
      if c.normal.y == -1
        .grounded = true

      .dx = 0 if c.normal.x != 0

    .dy += .gravity * dt unless .grounded

movement
