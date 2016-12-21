local movement

with tiny
  movement        = .processingSystem!
  movement.filter = .requireAll "x", "y", "dx", "dy", "frc_x", "frc_y"

movement.process = (e, dt) =>
  return unless bump_world\hasItem e
  with e
    .dx   -= (.dx / .frc_x) * dt
    .dy   -= (.dy / .frc_y) * dt

    .x, .y = bump_world\move .x + .dx, .y + .dy

movement
