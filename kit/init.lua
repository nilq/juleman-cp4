love.graphics.setDefaultFilter("nearest", "nearest")

shack  = require("kit/lib/shack")
state  = require("kit/lib/state")
konami = require("kit/lib/konami")
bump   = require("kit/lib/bump")

bump_world = bump.newWorld()

function love.run()
  local dt = 0

  local update_timer = 0
  local target_delta = 1 / 60

  if love.math then
    love.math.setRandomSeed(os.time())
  end

  if love.load then
    love.load()
  end

  if love.timer then
    love.timer.step()
  end

  state:switch("src/game")

  while true do
    update_timer = update_timer + dt

    if love.event then
      love.event.pump()

      for name, a, b, c, d, e, f in love.event.poll() do
        if name == "quit" then
          if not love.quit or not love.quit() then
            return a
          end
        end

        love.handlers[name](a, b, c, d, e, f)
      end
    end

    if love.timer then
      love.timer.step()
      dt = love.timer.getDelta()
    end

    if update_timer > target_delta then
      shack:update(dt)
      state:update(dt)
    end

    if love.graphics and love.graphics.isActive() then
      love.graphics.clear(love.graphics.getBackgroundColor())
      love.graphics.setColor(255, 255, 255)

      love.graphics.origin()

      state:draw()
      shack:apply()

      love.graphics.present()
    end

    if love.timer then
      love.timer.sleep(0.001)
    end
  end
end
